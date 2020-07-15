const mongoose = require('mongoose')
const meetingSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    time: {
        type: String,
        require: true, 
    },
    venue: {
        type: String,
        require:true

    },
    date: {
        type: String,
        require:true

    },
    description: {
        type: String,
        require:true
    },
    members:{
        type: String,
        require:true
    }    
}, {
    timestamps : true
})
const meeting = mongoose.model('Meeting',meetingSchema)

module.exports = meeting