// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.pet.PetAnimationSizeData

package com.sulake.habbo.room.object.visualization.pet
{
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils._SafeStr_1675;
    import com.sulake.habbo.room.object.visualization.data.*;

    public class PetAnimationSizeData extends AnimationSizeData 
    {

        public static const _SafeStr_8761:int = -1;

        private var _SafeStr_6024:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_6025:_SafeStr_24 = new _SafeStr_24();
        private var _defaultPosture:String;

        public function PetAnimationSizeData(_arg_1:int, _arg_2:int)
        {
            super(_arg_1, _arg_2);
        }

        public function definePostures(_arg_1:XML):Boolean
        {
            var _local_5:int;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_7:int;
            if (_arg_1 == null)
            {
                return (false);
            };
            if (_SafeStr_1675.checkRequiredAttributes(_arg_1, ["defaultPosture"]))
            {
                _defaultPosture = _arg_1.@defaultPosture;
            }
            else
            {
                _defaultPosture = null;
            };
            var _local_3:Array = ["id", "animationId"];
            var _local_4:XMLList = _arg_1.posture;
            _local_5 = 0;
            while (_local_5 < _local_4.length())
            {
                _local_2 = _local_4[_local_5];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_2, _local_3))
                {
                    return (false);
                };
                _local_6 = String(_local_2.@id);
                _local_7 = int(_local_2.@animationId);
                _SafeStr_6024.add(_local_6, _local_7);
                if (_defaultPosture == null)
                {
                    _defaultPosture = _local_6;
                };
                _local_5++;
            };
            if (_SafeStr_6024.getValue(_defaultPosture) == null)
            {
                return (false);
            };
            return (true);
        }

        public function defineGestures(_arg_1:XML):Boolean
        {
            var _local_2:int;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_5:int;
            if (_arg_1 == null)
            {
                return (true);
            };
            var _local_4:Array = ["id", "animationId"];
            var _local_6:XMLList = _arg_1.gesture;
            _local_2 = 0;
            while (_local_2 < _local_6.length())
            {
                _local_7 = _local_6[_local_2];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_7, _local_4))
                {
                    return (false);
                };
                _local_3 = String(_local_7.@id);
                _local_5 = int(_local_7.@animationId);
                _SafeStr_6025.add(_local_3, _local_5);
                _local_2++;
            };
            return (true);
        }

        public function getAnimationForPosture(_arg_1:String):int
        {
            if (_SafeStr_6024.getValue(_arg_1) == null)
            {
                _arg_1 = _defaultPosture;
            };
            return (_SafeStr_6024.getValue(_arg_1));
        }

        public function getGestureDisabled(_arg_1:String):Boolean
        {
            if (_arg_1 == "ded")
            {
                return (true);
            };
            return (false);
        }

        public function getAnimationForGesture(_arg_1:String):int
        {
            if (_SafeStr_6025.getValue(_arg_1) == null)
            {
                return (-1);
            };
            return (_SafeStr_6025.getValue(_arg_1));
        }

        public function getPostureForAnimation(_arg_1:int, _arg_2:Boolean):String
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_6024.length)))
            {
                return (_SafeStr_6024.getKey(_arg_1));
            };
            return ((_arg_2) ? _defaultPosture : null);
        }

        public function getGestureForAnimation(_arg_1:int):String
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_6025.length)))
            {
                return (_SafeStr_6025.getKey(_arg_1));
            };
            return (null);
        }

        public function getGestureForAnimationId(_arg_1:int):String
        {
            for each (var _local_2:String in _SafeStr_6025.getKeys())
            {
                if (_SafeStr_6025.getValue(_local_2) == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getPostureCount():int
        {
            return (_SafeStr_6024.length);
        }

        public function getGestureCount():int
        {
            return (_SafeStr_6025.length);
        }


    }
}//package com.sulake.habbo.room.object.visualization.pet

// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_6024 = "_-71e" (String#7432, DoABC#4)
// _SafeStr_6025 = "_-h1r" (String#6715, DoABC#4)
// _SafeStr_8761 = "_-s1K" (String#32233, DoABC#4)


