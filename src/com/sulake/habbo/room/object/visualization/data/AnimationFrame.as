// by nota

//com.sulake.habbo.room.object.visualization.data.AnimationFrame

package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrame 
    {

        public static const FRAME_REPEAT_FOREVER:int = -1;
        public static const _SafeStr_8748:int = -1;
        private static const POOL_SIZE_LIMIT:int = 3000;
        private static const _SafeStr_4027:Array = [];

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4050:int = 0;
        private var _SafeStr_4051:int = 0;
        private var _SafeStr_6177:int = 1;
        private var _SafeStr_6178:int = 1;
        private var _SafeStr_6179:int = 1;
        private var _SafeStr_6180:int = -1;
        private var _activeSequenceOffset:int = 0;
        private var _isLastFrame:Boolean = false;
        private var _SafeStr_6181:Boolean = false;


        public static function allocate(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int=-1, _arg_8:int=0):AnimationFrame
        {
            var _local_9:AnimationFrame = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (AnimationFrame)());
            _local_9._SafeStr_6181 = false;
            _local_9._SafeStr_3820 = _arg_1;
            _local_9._SafeStr_4050 = _arg_2;
            _local_9._SafeStr_4051 = _arg_3;
            _local_9._isLastFrame = _arg_6;
            if (_arg_4 < 1)
            {
                _arg_4 = 1;
            };
            _local_9._SafeStr_6177 = _arg_4;
            if (_arg_5 < 0)
            {
                _arg_5 = -1;
            };
            _local_9._SafeStr_6178 = _arg_5;
            _local_9._SafeStr_6179 = _arg_5;
            if (_arg_7 >= 0)
            {
                _local_9._SafeStr_6180 = _arg_7;
                _local_9._activeSequenceOffset = _arg_8;
            };
            return (_local_9);
        }


        public function get id():int
        {
            if (_SafeStr_3820 >= 0)
            {
                return (_SafeStr_3820);
            };
            return (-(_SafeStr_3820) * Math.random());
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get repeats():int
        {
            return (_SafeStr_6177);
        }

        public function get frameRepeats():int
        {
            return (_SafeStr_6178);
        }

        public function get isLastFrame():Boolean
        {
            return (_isLastFrame);
        }

        public function get remainingFrameRepeats():int
        {
            if (_SafeStr_6178 < 0)
            {
                return (-1);
            };
            return (_SafeStr_6179);
        }

        public function set remainingFrameRepeats(_arg_1:int):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (((_SafeStr_6178 > 0) && (_arg_1 > _SafeStr_6178)))
            {
                _arg_1 = _SafeStr_6178;
            };
            _SafeStr_6179 = _arg_1;
        }

        public function get activeSequence():int
        {
            return (_SafeStr_6180);
        }

        public function get activeSequenceOffset():int
        {
            return (_activeSequenceOffset);
        }

        public function recycle():void
        {
            if (!_SafeStr_6181)
            {
                _SafeStr_6181 = true;
                if (_SafeStr_4027.length < 3000)
                {
                    _SafeStr_4027.push(this);
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.data

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_6177 = "_-228" (String#10802, DoABC#4)
// _SafeStr_6178 = "_-S1v" (String#5415, DoABC#4)
// _SafeStr_6179 = "_-w1u" (String#15419, DoABC#4)
// _SafeStr_6180 = "_-91D" (String#25959, DoABC#4)
// _SafeStr_6181 = "_-OZ" (String#15573, DoABC#4)
// _SafeStr_8748 = "_-A1c" (String#33964, DoABC#4)


