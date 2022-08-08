#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QFile>
#include <QFileDialog>
#include <QTextStream>
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    QFile file(QFileDialog::getOpenFileName(
                   this,
                   tr("Open file"),
                   "C://",
                   "All file (*.*);;Text File (*.txt)"));

    file.open(QIODevice::ReadOnly | QIODevice::Text);

    QTextStream stream(&file);
    QString text = stream.readAll();
    ui->textEdit->setText(text);
    file.close();

    QString filename = file.fileName();

    QMessageBox::information(this, tr("File name"), filename);
}

