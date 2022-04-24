// by nota

//com.sulake.core.window.motion.Dispose

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class Dispose extends Motion 
    {

        public function Dispose(_arg_1:_SafeStr_3109)
        {
            super(_arg_1);
        }

        override friend function tick(_arg_1:int):void
        {
            super.friend::tick(_arg_1);
            if (((target) && (!(target.disposed))))
            {
                target.dispose();
                target = null;
            };
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


