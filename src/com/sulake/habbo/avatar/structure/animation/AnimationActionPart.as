// by nota

//com.sulake.habbo.avatar.structure.animation.AnimationActionPart

package com.sulake.habbo.avatar.structure.animation
{
    public class AnimationActionPart 
    {

        private var _SafeStr_5670:Array;

        public function AnimationActionPart(_arg_1:XML)
        {
            var _local_2:int;
            super();
            _SafeStr_5670 = [];
            for each (var _local_3:XML in _arg_1.frame)
            {
                _SafeStr_5670.push(new AnimationFrame(_local_3));
                _local_2 = parseInt(_local_3.@repeats);
                if (_local_2 > 1)
                {
                    while (--_local_2 > 0)
                    {
                        _SafeStr_5670.push(_SafeStr_5670[(_SafeStr_5670.length - 1)]);
                    };
                };
            };
        }

        public function get frames():Array
        {
            return (_SafeStr_5670);
        }


    }
}//package com.sulake.habbo.avatar.structure.animation

// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)


