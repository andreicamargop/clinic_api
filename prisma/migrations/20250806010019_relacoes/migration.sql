/*
  Warnings:

  - You are about to drop the column `medicoResponsavel_id` on the `consulta` table. All the data in the column will be lost.
  - You are about to drop the column `medicoResponsavel_id` on the `prontuario` table. All the data in the column will be lost.
  - You are about to drop the `usario` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `medico_responsavel_id` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `medico_responsavel_id` to the `Prontuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `consulta` DROP COLUMN `medicoResponsavel_id`,
    ADD COLUMN `medico_responsavel_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `prontuario` DROP COLUMN `medicoResponsavel_id`,
    ADD COLUMN `medico_responsavel_id` INTEGER NOT NULL;

-- DropTable
DROP TABLE `usario`;

-- CreateTable
CREATE TABLE `Usuario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `cargo` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Usuario_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Prontuario` ADD CONSTRAINT `Prontuario_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prontuario` ADD CONSTRAINT `Prontuario_medico_responsavel_id_fkey` FOREIGN KEY (`medico_responsavel_id`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Consulta` ADD CONSTRAINT `Consulta_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Consulta` ADD CONSTRAINT `Consulta_medico_responsavel_id_fkey` FOREIGN KEY (`medico_responsavel_id`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Exame` ADD CONSTRAINT `Exame_paciente_id_fkey` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
