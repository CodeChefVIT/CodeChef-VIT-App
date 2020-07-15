const AccessControl = require("accesscontrol");
const ac = new AccessControl();

exports.roles = (function() {
  ac.grant("cat1")

  ac.grant("cat2")
    .delete("meeting")
    .create("meeting")
    

  ac.grant("cat3")
    .extend("cat2")
    .delete("user")

  ac.grant("cat5")
    .extend("cat2")
    .extend("cat3")
    .update("user")
   

  return ac;
})();
