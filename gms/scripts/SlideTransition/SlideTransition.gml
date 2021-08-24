/// @desc SlideTransition(mode, targetroom)
/// @arg Mode sets transition mode between next, restart and goto.
/// @arg Target sets target rooom when using goto mode.

function SlideTransition(_mode,_target)
{
    with(oTransition)
    {
        mode = _mode;
        target = _target;
        if(argument_count > 1) _target = argument[1];
    }
}