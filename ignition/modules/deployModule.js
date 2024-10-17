const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
require("dotenv").config();
const { INITIAL_OWNER } = process.env;


module.exports = buildModule("deployModule", (m) => {
  
  const AtletaTech = m.contract("AtletaTech", [INITIAL_OWNER]);

  return { AtletaTech };
});

