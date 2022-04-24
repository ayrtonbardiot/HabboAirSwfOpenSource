// by nota

//com.sulake.habbo.avatar.structure.animation.AnimationAction

package com.sulake.habbo.avatar.structure.animation
{
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;

    public class AnimationAction 
    {

        public static const DEFAULT_OFFSET:Point = new Point(0, 0);

        private var _SafeStr_3820:String;
        private var _SafeStr_6225:Dictionary;
        private var _SafeStr_6226:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_6078:int;
        private var _SafeStr_6227:Array;

        public function AnimationAction(_arg_1:XML)
        {
            var _local_10:* = null;
            var _local_5:int;
            var _local_12:* = null;
            var _local_6:int;
            var _local_4:* = null;
            var _local_11:* = null;
            var _local_13:int;
            var _local_14:int;
            var _local_3:int;
            super();
            _SafeStr_3820 = String(_arg_1.@id);
            _SafeStr_6225 = new Dictionary();
            for each (var _local_8:XML in _arg_1.part)
            {
                _local_10 = new AnimationActionPart(_local_8);
                _SafeStr_6225[String(_local_8.@["set-type"])] = _local_10;
                _SafeStr_6078 = Math.max(_SafeStr_6078, _local_10.frames.length);
            };
            _SafeStr_6227 = [];
            for each (var _local_2:XML in _arg_1.offsets.frame)
            {
                _local_5 = parseInt(_local_2.@id);
                _SafeStr_6078 = Math.max(_SafeStr_6078, _local_5);
                _local_12 = new _SafeStr_24();
                _SafeStr_6226[_local_5] = _local_12;
                for each (var _local_9:XML in _local_2.directions.direction)
                {
                    _local_6 = parseInt(_local_9.@id);
                    _local_4 = new _SafeStr_24();
                    _local_12[_local_6] = _local_4;
                    for each (var _local_7:XML in _local_9.bodypart)
                    {
                        _local_11 = String(_local_7.@id);
                        _local_13 = ((_local_7.hasOwnProperty("@dx")) ? parseInt(_local_7.@dx) : 0);
                        _local_14 = ((_local_7.hasOwnProperty("@dy")) ? parseInt(_local_7.@dy) : 0);
                        _local_4[_local_11] = new Point(_local_13, _local_14);
                    };
                };
                _SafeStr_6227.push(_local_5);
                _local_3 = parseInt(_local_2.@repeats);
                if (_local_3 > 1)
                {
                    while (--_local_3 > 0)
                    {
                        _SafeStr_6227.push(_local_5);
                    };
                };
            };
        }

        public function getPart(_arg_1:String):AnimationActionPart
        {
            return (_SafeStr_6225[_arg_1] as AnimationActionPart);
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get parts():Dictionary
        {
            return (_SafeStr_6225);
        }

        public function get frameCount():int
        {
            return (_SafeStr_6078);
        }

        public function getFrameBodyPartOffset(_arg_1:int, _arg_2:int, _arg_3:String):Point
        {
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_7:int = (_arg_2 % _SafeStr_6227.length);
            var _local_4:int = _SafeStr_6227[_local_7];
            var _local_5:_SafeStr_24 = _SafeStr_6226[_local_4];
            if (_local_5)
            {
                _local_6 = _local_5[_arg_1];
                if (_local_6)
                {
                    _local_8 = _local_6[_arg_3];
                };
            };
            return ((_local_8 != null) ? _local_8 : DEFAULT_OFFSET);
        }


    }
}//package com.sulake.habbo.avatar.structure.animation

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_6078 = "_-H1Z" (String#2266, DoABC#4)
// _SafeStr_6225 = "_-s1" (String#12370, DoABC#4)
// _SafeStr_6226 = "_-e15" (String#15095, DoABC#4)
// _SafeStr_6227 = "_-91e" (String#3998, DoABC#4)


