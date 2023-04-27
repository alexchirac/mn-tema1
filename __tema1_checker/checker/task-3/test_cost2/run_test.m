function run_test()
    "task-3";
    fout = fopen("out", "w+");
    load("../../input/task3/cost2.mat");

    input_layer_size = 400;
    hidden_layer_size = 25;
    output_layer_size = 10;

    lambda = 1;
    [J, grad] = cost_function(weights, X, y, lambda, input_layer_size, ...
                            hidden_layer_size, output_layer_size);
    
    fdisp(fout, [J; grad]);

    fclose(fout);
endfunction