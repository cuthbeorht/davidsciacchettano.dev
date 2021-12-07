---
layout: post
title: SOLID Principles
date: 2021-12-05 22h46
categories: Dev blog update
---

# SOLID Principles

## Single Responsbility Principle

`A class should do one thing and one thingh only. By extension, this means it should have only reason to change.`

Now what the hell does that mean? Well, I will do my best to explain it, or at least **MY** understanding of it. 

First of all, what is a `class`? It is an object, but that's not what I mean is what is considered a class? My understanding is that
any piece of code should have one reason for being. This applies to a:

- Class
- Test
- Module

Let's take a test I wrote recently (pseudocode):

```typescript
describe('Service', () => {
    const dbStub = {
        get: Function
    }

    beforeEach(() => {
        dbStub.get.resvolves({[{id: 1, key: 'Cool', value: 'Some Value'}]})
    })

    it('should behave in some way', () => {
        const result = Service.method()

        expect(result.id).to.equal(1)
        expect(dbStub.get).to.have.been.called
    })
})
```

During review, a comment said that the Single Responsibility Principle applies not only to classes, but tests as well. And I broke it. My test was checking 2 behavours. I should check the result and what was called in seprate tests.

```typescript
describe('Service', () => {
    const dbStub = {
        get: Function
    }

    beforeEach(() => {
        dbStub.get.resvolves({[{id: 1, key: 'Cool', value: 'Some Value'}]})
    })

    it('should return 1', () => {
        const result = Service.method()

        expect(result.id).to.equal(1)
    })

    it('should call stub', () => {
        const result = Service.method()

        expect(dbStub.get).to.have.been.called
    })
})
```

This is more code. However, each test is very clearly doing one thing. If I need to change the service call, I probably won't have to change the stub, but maybe the expected result.

Feel free to 