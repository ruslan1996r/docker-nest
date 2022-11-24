"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const helmet = require("helmet");
const app_module_1 = require("./app.module");
const port = process.env.PORT || 4000;
const msg = () => console.log(`App on: http://localhost:${port}/`);
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    app.enableCors({
        origin: (req, callback) => callback(null, true),
    });
    app.use(helmet());
    await app.listen(port);
}
bootstrap().then(msg);
//# sourceMappingURL=main.js.map