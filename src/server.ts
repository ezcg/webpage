import * as http from "node:http";
import { greet } from "./greet";

http
  .createServer((_req, res: http.ServerResponse) => {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.write(greet("webgamer"));
    res.end();
  })
  .listen(process.env["WEBGAME_HOST_PORT"]);

console.log("Server running at port " + process.env["WEBGAME_HOST_PORT"]);
console.log("http://localhost:" + process.env["WEBGAME_HOST_PORT"] + "/")
