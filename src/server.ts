import * as fs from "node:fs";
import * as path from "node:path";
import * as http from "node:http";

const port = Number(process.env["WEBGAME_HOST_PORT"] ?? 3000);
const indexPath = path.resolve("public", "index.html");

http
  .createServer((req, res) => {
    if (req.url !== "/") {
      res.statusCode = 404;
      res.end("Not Found");
      return;
    }

    res.statusCode = 200;
    res.setHeader("Content-Type", "text/html; charset=utf-8");
    fs.createReadStream(indexPath).pipe(res);
  })
  .listen(port);

console.log("Server running at port " + port);
console.log("http://localhost:" + port + "/");
