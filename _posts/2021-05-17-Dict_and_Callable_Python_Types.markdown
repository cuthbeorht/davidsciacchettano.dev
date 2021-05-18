# Dict and Callable Typing in Python

## Summary

This will be a short article on Typing on the specific Types Dict and Callable.

Reference from [Python Docs](https://docs.python.org/3/library/typing.html)

### Callable

With a Type Callable, it means you are passing in a function, a callback if you will ;) .

#### Syntax

```python

def func(callback: Callback[[param1, param2], return_param] -> None:
    ...
    return_param = callback(param1, param2)
```

Here, a callback is expecting 2 params and is returning one. The names are arbitrary. Also, you could use the ellipses operator to indicate an infinite list of params.

```python
def func(callback: Callback[..., return_param] -> None:
    ...
    return_param = callback(param1, param2, param3, param4, etc)
```

### Dict

A Dict is a set of key/value pairs. The keys can be strings, numbers, tuples - As long as the key is an Immutable type. Here is the syntax for the Dict type.

#### Syntax

```python
my_dict: Dict[str, str] = {
    "key1": "value1",
    "key2": "value2",
}
```

In the typing specification, it is `Dict[key_type, value_type]`