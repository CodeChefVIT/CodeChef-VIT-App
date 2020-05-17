const express = require('express')
const Meeting = require('../models/meeting')

const router = new express.Router()
const userController = require('../controllers/userController');
const auth = require('../middleware/auth')
router.post('/createMeeting',auth ,userController.grantAccess('create', 'meeting'), userController.createMeeting);

router.get('/meetings',auth , async (req, res) => {
    try {
        const meeting = await Meeting.find({})
        res.send(meeting)
    } catch (e) {
        res.status(500).send()
    }
})

router.delete('/delete/:_id', auth, userController.grantAccess('delete', 'meeting'), userController.deleteMeeting);


module.exports = router