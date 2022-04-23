// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils.animation.Transitions

package com.sulake.habbo.utils.animation
{
    import flash.utils.Dictionary;

    public class Transitions 
    {

        public static const LINEAR:String = "linear";
        public static const EASE_IN:String = "easeIn";
        public static const _SafeStr_9098:String = "easeOut";
        public static const _SafeStr_9099:String = "easeInOut";
        public static const EASE_OUT_IN:String = "easeOutIn";
        public static const EASE_IN_BACK:String = "easeInBack";
        public static const EASE_OUT_BACK:String = "easeOutBack";
        public static const EASE_IN_OUT_BACK:String = "easeInOutBack";
        public static const EASE_OUT_IN_BACK:String = "easeOutInBack";
        public static const _SafeStr_9100:String = "easeInElastic";
        public static const _SafeStr_9101:String = "easeOutElastic";
        public static const _SafeStr_9102:String = "easeInOutElastic";
        public static const _SafeStr_9103:String = "easeOutInElastic";
        public static const _SafeStr_9104:String = "easeInBounce";
        public static const _SafeStr_9105:String = "easeOutBounce";
        public static const _SafeStr_9106:String = "easeInOutBounce";
        public static const _SafeStr_9107:String = "easeOutInBounce";

        private static var _SafeStr_9108:Dictionary;


        public static function getTransition(_arg_1:String):Function
        {
            if (_SafeStr_9108 == null)
            {
                registerDefaults();
            };
            return (_SafeStr_9108[_arg_1]);
        }

        public static function register(_arg_1:String, _arg_2:Function):void
        {
            if (_SafeStr_9108 == null)
            {
                registerDefaults();
            };
            _SafeStr_9108[_arg_1] = _arg_2;
        }

        private static function registerDefaults():void
        {
            _SafeStr_9108 = new Dictionary();
            register("linear", linear);
            register("easeIn", easeIn);
            register("easeOut", easeOut);
            register("easeInOut", easeInOut);
            register("easeOutIn", easeOutIn);
            register("easeInBack", easeInBack);
            register("easeOutBack", easeOutBack);
            register("easeInOutBack", easeInOutBack);
            register("easeOutInBack", easeOutInBack);
            register("easeInElastic", easeInElastic);
            register("easeOutElastic", easeOutElastic);
            register("easeInOutElastic", easeInOutElastic);
            register("easeOutInElastic", easeOutInElastic);
            register("easeInBounce", easeInBounce);
            register("easeOutBounce", easeOutBounce);
            register("easeInOutBounce", easeInOutBounce);
            register("easeOutInBounce", easeOutInBounce);
        }

        protected static function linear(_arg_1:Number):Number
        {
            return (_arg_1);
        }

        protected static function easeIn(_arg_1:Number):Number
        {
            return ((_arg_1 * _arg_1) * _arg_1);
        }

        protected static function easeOut(_arg_1:Number):Number
        {
            var _local_2:Number = (_arg_1 - 1);
            return (((_local_2 * _local_2) * _local_2) + 1);
        }

        protected static function easeInOut(_arg_1:Number):Number
        {
            return (easeCombined(easeIn, easeOut, _arg_1));
        }

        protected static function easeOutIn(_arg_1:Number):Number
        {
            return (easeCombined(easeOut, easeIn, _arg_1));
        }

        protected static function easeInBack(_arg_1:Number):Number
        {
            var _local_2:* = 1.70158;
            return (Math.pow(_arg_1, 2) * (((_local_2 + 1) * _arg_1) - _local_2));
        }

        protected static function easeOutBack(_arg_1:Number):Number
        {
            var _local_3:Number = (_arg_1 - 1);
            var _local_2:* = 1.70158;
            return ((Math.pow(_local_3, 2) * (((_local_2 + 1) * _local_3) + _local_2)) + 1);
        }

        protected static function easeInOutBack(_arg_1:Number):Number
        {
            return (easeCombined(easeInBack, easeOutBack, _arg_1));
        }

        protected static function easeOutInBack(_arg_1:Number):Number
        {
            return (easeCombined(easeOutBack, easeInBack, _arg_1));
        }

        protected static function easeInElastic(_arg_1:Number):Number
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            if (((_arg_1 == 0) || (_arg_1 == 1)))
            {
                return (_arg_1);
            };
            _local_2 = 0.3;
            _local_3 = (_local_2 / 4);
            _local_4 = (_arg_1 - 1);
            return ((-1 * Math.pow(2, (10 * _local_4))) * Math.sin((((_local_4 - _local_3) * (2 * 3.14159265358979)) / _local_2)));
        }

        protected static function easeOutElastic(_arg_1:Number):Number
        {
            var _local_2:Number;
            var _local_3:Number;
            if (((_arg_1 == 0) || (_arg_1 == 1)))
            {
                return (_arg_1);
            };
            _local_2 = 0.3;
            _local_3 = (_local_2 / 4);
            return ((Math.pow(2, (-10 * _arg_1)) * Math.sin((((_arg_1 - _local_3) * (2 * 3.14159265358979)) / _local_2))) + 1);
        }

        protected static function easeInOutElastic(_arg_1:Number):Number
        {
            return (easeCombined(easeInElastic, easeOutElastic, _arg_1));
        }

        protected static function easeOutInElastic(_arg_1:Number):Number
        {
            return (easeCombined(easeOutElastic, easeInElastic, _arg_1));
        }

        protected static function easeInBounce(_arg_1:Number):Number
        {
            return (1 - easeOutBounce((1 - _arg_1)));
        }

        protected static function easeOutBounce(_arg_1:Number):Number
        {
            var _local_4:Number;
            var _local_3:* = 7.5625;
            var _local_2:* = 2.75;
            if (_arg_1 < (1 / _local_2))
            {
                _local_4 = (_local_3 * Math.pow(_arg_1, 2));
            }
            else
            {
                if (_arg_1 < (2 / _local_2))
                {
                    _arg_1 = (_arg_1 - (1.5 / _local_2));
                    _local_4 = ((_local_3 * Math.pow(_arg_1, 2)) + 0.75);
                }
                else
                {
                    if (_arg_1 < (2.5 / _local_2))
                    {
                        _arg_1 = (_arg_1 - (2.25 / _local_2));
                        _local_4 = ((_local_3 * Math.pow(_arg_1, 2)) + 0.9375);
                    }
                    else
                    {
                        _arg_1 = (_arg_1 - (2.625 / _local_2));
                        _local_4 = ((_local_3 * Math.pow(_arg_1, 2)) + 0.984375);
                    };
                };
            };
            return (_local_4);
        }

        protected static function easeInOutBounce(_arg_1:Number):Number
        {
            return (easeCombined(easeInBounce, easeOutBounce, _arg_1));
        }

        protected static function easeOutInBounce(_arg_1:Number):Number
        {
            return (easeCombined(easeOutBounce, easeInBounce, _arg_1));
        }

        protected static function easeCombined(_arg_1:Function, _arg_2:Function, _arg_3:Number):Number
        {
            if (_arg_3 < 0.5)
            {
                return (0.5 * _arg_1((_arg_3 * 2)));
            };
            return ((0.5 * _arg_2(((_arg_3 - 0.5) * 2))) + 0.5);
        }


    }
}//package com.sulake.habbo.utils.animation

// _SafeStr_9098 = "_-R1m" (String#8353, DoABC#3)
// _SafeStr_9099 = "_-WW" (String#8744, DoABC#3)
// _SafeStr_9100 = "_-G16" (String#7586, DoABC#3)
// _SafeStr_9101 = "_-tW" (String#10286, DoABC#3)
// _SafeStr_9102 = "_-Va" (String#8643, DoABC#3)
// _SafeStr_9103 = "_-To" (String#8532, DoABC#3)
// _SafeStr_9104 = "_-RH" (String#8370, DoABC#3)
// _SafeStr_9105 = "_-xs" (String#10573, DoABC#3)
// _SafeStr_9106 = "_-gw" (String#9439, DoABC#3)
// _SafeStr_9107 = "_-E1h" (String#7479, DoABC#3)
// _SafeStr_9108 = "_-yz" (String#10651, DoABC#3)


