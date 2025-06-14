-- CreateEnum
CREATE TYPE "Course" AS ENUM ('ADS', 'GE', 'GTI', 'GEMP', 'MEC');

-- CreateEnum
CREATE TYPE "Semester" AS ENUM ('SEM1', 'SEM2', 'SEM3', 'SEM4', 'SEM5', 'SEM6');

-- CreateEnum
CREATE TYPE "Location" AS ENUM ('AUDITORIO', 'BIBLIOTECA', 'SALA_MAKER', 'LAB_MECANICA_METROLOGIA', 'LAB_SISTEMAS_INTEGRADOS', 'LAB_HIDRAULICA_PNEUMATICA', 'LAB_ENSAIOS_METALOGRAFICOS', 'LAB_ELETRONICA_POTENCIA', 'LAB_COMANDOS_ELETRICOS', 'LAB_CONTROLE_PROCESSOS', 'LAB_INFORMATICA_1', 'LAB_INFORMATICA_2', 'LAB_INFORMATICA_3', 'LAB_INFORMATICA_4', 'LAB_INFORMATICA_5', 'LAB_INFORMATICA_6', 'SALA_1', 'SALA_2', 'SALA_3', 'SALA_4', 'SALA_5', 'SALA_6', 'SALA_7', 'SALA_8', 'SALA_9', 'SALA_9_3_4', 'SALA_10', 'SALA_11', 'SALA_12', 'OUTROS');

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "categoryId" TEXT NOT NULL,
    "course" "Course" NOT NULL,
    "semester" "Semester",
    "maxParticipants" INTEGER NOT NULL,
    "currentParticipants" INTEGER NOT NULL DEFAULT 0,
    "location" "Location" NOT NULL,
    "customLocation" VARCHAR(100),
    "speakerName" VARCHAR(60) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,
    "description" VARCHAR(500) NOT NULL,
    "isRestricted" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
