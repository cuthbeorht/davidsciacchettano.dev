---
layout: post
title: SOLID Principles
date: 2021-08-13 20:34:20
categories: Dev blog update
---

# SOLID Principles

## Single Responsbility Principle

`A class should do one thing and one thingh only. By extension, this means it should have only reason to change.`

Now what the hell does that mean? Well, I will do my best to explain it, or at least **MY** understanding of it. 

Let's create a Plain Old Python Object ( I borrowed this from Plain Ol' Java Object POJO - I'm a Java guy diong Python now. What can I say? I switched over to the dark side :D ):

```python

from typing import Dict


class Car:
    """
    This is a Car object
    """

    number_of_doors: int
    number_of_wheels: int
    horsepower: int
    car_class: str # This could be an Enum; Making it simpler for the example
    engine_size: str
    price: float

    def __str__(self) -> Dict:
        return {
            number_of_wheels: self.number_of_wheels,
            number_of_doors: self.number_of_doors,
            horsepower: self.horsepower,
            car_class: self.car_class,
            engine_size: self.engine_size,
            price: self.price
        }

```

This is nothing fancy. It's a class in Python that defines a Car object. How original, I know, right? Let's add some logic!

```python

class CarBuilder:
    """
    Provides methods to build a car based on type, number of doors, number of wheels
    """

    def calculate_horse_power(self, car_class: str, number_of_doors: int, engine_size: str) -> int:
        if engine

```