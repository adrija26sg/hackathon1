# Generated by Django 4.1.3 on 2023-02-04 15:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_token'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='grad_year',
            field=models.IntegerField(default=-1.0),
            preserve_default=False,
        ),
    ]