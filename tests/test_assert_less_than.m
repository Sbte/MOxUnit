function test_suite=test_assert_less_than()
    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions=localfunctions();
    catch % no problem; early Matlab versions can use initTestSuite fine
    end
    initTestSuite;

function test_assert_less_than_exceptions
    assertExceptionThrown(@()assertLessThan([1],'a'), ...
                          'assertLessThan:classNotEqual');
    assertExceptionThrown(@()assertLessThan([1 2],[1,2,3]));
    assertExceptionThrown(@()assertLessThan(1,1), ...
                          'assertLessThan:notLessThan');
    assertExceptionThrown(@()assertLessThan([1,2,3],[2,3,3]), ...
                          'assertLessThan:notLessThan');

function test_assert_less_than_passes
    assertLessThan(0,1);
    assertLessThan([0,0],[1,1]);
    assertLessThan([0,0],[1;1]);