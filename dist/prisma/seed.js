"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const _1 = __importDefault(require("."));
const types_1 = require("../@types/types");
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        yield _1.default.category.upsert({
            where: { name: types_1.FIXED_CATEGORIES.CURSO_ONLINE.name },
            update: {},
            create: { name: types_1.FIXED_CATEGORIES.CURSO_ONLINE.name }
        });
    });
}
main()
    .catch(e => {
    console.error('❌ Erro ao rodar seed:', e);
    process.exit(1);
})
    .finally(() => __awaiter(void 0, void 0, void 0, function* () {
    yield _1.default.$disconnect();
}));
