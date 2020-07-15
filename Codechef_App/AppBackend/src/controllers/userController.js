const User = require('../models/user')
const Meeting = require('../models/meeting')
const { roles } = require('../roles')
const bcrypt = require('bcrypt')

exports.grantAccess = function(action, resource) {
    return async (req, res, next) => {
      try {
        const permission = roles.can(req.user.role)[action](resource);
        if (!permission.granted) {
          return res.status(401).json({
            error: "You don't have enough permission to perform this action"
          });
        }
        next()
      } catch (error) {
        next(error)
      }
    }
  }

 
exports.updateUser = async (req, res, next) => {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['role']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

    if (!isValidOperation) {
        return res.status(400).send({ error: 'Invalid updates!' })
    }

    try {
        updates.forEach((update) => req.user[update] = req.body[update])
        await req.user.save()
        res.send(req.user)
    } catch (e) {
        res.status(400).send(e)
    }
}

  exports.deleteUser = async (req, res, next) => {
    try {
      const userId = req.params.id;
      await User.findByIdAndDelete(userId);
      res.status(200).json({
        message: 'User has been deleted'
      });
    } catch (error) {
      next(error)
    }
  }

  exports.createMeeting= async (req, res, next) => {
    const meeting = new Meeting(req.body)
  
    try {
        await meeting.save()
        res.status(201).send(meeting)
    } catch (e) {
        res.status(400).send(e)
      next(error)
    }
  }

  exports.deleteMeeting = async (req, res, next) => {
    try {
      const meetingId = req.params.id;
      await Meeting.findByIdAndDelete(meetingId);
      res.status(200).json({
        message: 'meeting has been deleted'
      });
    } catch (error) {
      next(error)
    }
  }