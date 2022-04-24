// by nota

//com.sulake.core.window.motion.Motion

package com.sulake.core.window.motion
{
    import com.sulake.core.window._SafeStr_3109;

    use namespace friend;

    public class Motion 
    {

        protected var _SafeStr_4017:_SafeStr_3109;
        protected var _SafeStr_4016:Boolean;
        protected var _SafeStr_4018:Boolean = true;
        protected var _SafeStr_4019:String;

        public function Motion(_arg_1:_SafeStr_3109)
        {
            _SafeStr_4017 = _arg_1;
        }

        public function get running():Boolean
        {
            return (((_SafeStr_4016) && (_SafeStr_4017)) && (!(_SafeStr_4017.disposed)));
        }

        public function get complete():Boolean
        {
            return (_SafeStr_4018);
        }

        public function set target(_arg_1:_SafeStr_3109):void
        {
            _SafeStr_4017 = _arg_1;
        }

        public function get target():_SafeStr_3109
        {
            return (_SafeStr_4017);
        }

        public function set tag(_arg_1:String):void
        {
            _SafeStr_4019 = _arg_1;
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }

        friend function start():void
        {
            _SafeStr_4016 = true;
        }

        friend function update(_arg_1:Number):void
        {
        }

        friend function stop():void
        {
            _SafeStr_4017 = null;
            _SafeStr_4016 = false;
        }

        friend function tick(_arg_1:int):void
        {
        }


    }
}//package com.sulake.core.window.motion

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)
// _SafeStr_4017 = "_-eB" (String#2049, DoABC#4)
// _SafeStr_4018 = "_-2S" (String#2675, DoABC#4)
// _SafeStr_4019 = "_-LH" (String#3197, DoABC#4)


