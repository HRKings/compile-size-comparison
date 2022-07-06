# Size comparison

This is a very simple repo to test the file sizes of a "Hello World" program written in different languages

## Results
### File sizes in bytes:
```
c_dynamic           ->  20544
c_dynamic_strip     ->  14408
c_static            ->  865560
c_static_strip      ->  778248
cpp_dynamic         ->  20976
cpp_dynamic_strip   ->  14424
cpp_static          ->  2439536
cpp_static_strip    ->  1958704
go_static           ->  1758428
go_static_strip     ->  1180440
rust_dynamic        ->  22504
rust_dynamic_strip  ->  14464
rust_static         ->  3845960
rust_static_strip   ->  321848
```

### File sizes (human readable):
```
c_dynamic           ->  21K
c_dynamic_strip     ->  15K
c_static            ->  846K
c_static_strip      ->  761K
cpp_dynamic         ->  21K
cpp_dynamic_strip   ->  15K
cpp_static          ->  2,4M
cpp_static_strip    ->  1,9M
go_static           ->  1,7M
go_static_strip     ->  1,2M
rust_dynamic        ->  22K
rust_dynamic_strip  ->  15K
rust_static         ->  3,7M
rust_static_strip   ->  315K
```

## Testing it yourself

If you clone this repository the test can be run using the `test.sh` which will compile the several programs (one static, one dynamic and a stripped variation of the two) and will print the results.
