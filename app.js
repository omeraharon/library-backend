global.config = require("./config.json");
const express = require("express");
const cors = require("cors");
const controller = require("./controller-layer/library-controller");
const server = express();

server.use(cors());
server.use(express.json());
server.use("/api/library", controller);

server.use("*", (req, res) => res.status(404).send("Route not found"));

server.listen(3002, console.log("Listening...")); 
