macro_rules! add {
    ( $( $x:expr ),* ) => {
        {
            let mut accu = 0;
            $(
                accu += $x;
            )*
            accu
        }
    };
}
