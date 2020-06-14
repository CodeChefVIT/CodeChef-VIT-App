const express = require('express')
const User = require('../models/user')
const auth = require('../middleware/auth')
const userController = require('../controllers/userController');
const router = new express.Router()

router.post('/signup', async (req, res) => {
    const user = new User(req.body)
    if ((user.key==process.env.cat1&&user.role =='cat1')||(user.key ==process.env.cat2 && user.role =='cat2')) {
    try {
        await user.save()
        const token = await user.generateAuthToken()
        res.status(201).send({ user, token })
    } catch (e) {
        res.status(400).send(e)
    }}
    else{
        throw  res.status(400).send()

    }
})

router.post('/login', async (req, res) => {
    try {
        const user = await User.findByCredentials(req.body.email, req.body.password)
        const token = await user.generateAuthToken()
        res.send({ user, token })
    } catch (e) {
        res.status(400).send()
    }
})

router.post('/logout', auth, async (req, res) => {
    try {
        req.user.tokens = req.user.tokens.filter((token) => {
            return token.token !== req.token
        })
        await req.user.save()

        res.send()
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/users',auth, async (req, res) => {
    try {
        const user = await User.find({})
        res.send(user)
    } catch (e) {
        res.status(500).send()
    }
})

router.put('/user/:id', auth, userController.grantAccess('update', 'user'), userController.updateUser)
router.delete('/user/:id', auth, userController.grantAccess('delete', 'user'), userController.deleteUser)


module.exports = router
