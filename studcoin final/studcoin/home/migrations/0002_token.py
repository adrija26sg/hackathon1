# Generated by Django 4.1.3 on 2023-02-04 14:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='token',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('token_name', models.CharField(max_length=50)),
                ('initial_supply', models.IntegerField()),
                ('mined_tokens', models.IntegerField()),
            ],
        ),
    ]