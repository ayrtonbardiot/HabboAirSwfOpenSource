// by nota

//com.sulake.habbo.room.object.visualization.data.AnimationFrameSequenceData

package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrameSequenceData 
    {

        private var _SafeStr_5670:Array = [];
        private var _SafeStr_6227:Array = [];
        private var _SafeStr_6178:Array = [];
        private var _SafeStr_6782:Boolean = false;
        private var _SafeStr_4406:int = 1;

        public function AnimationFrameSequenceData(_arg_1:int, _arg_2:Boolean)
        {
            if (_arg_1 < 1)
            {
                _arg_1 = 1;
            };
            _SafeStr_4406 = _arg_1;
            _SafeStr_6782 = _arg_2;
        }

        public function get isRandom():Boolean
        {
            return (_SafeStr_6782);
        }

        public function get frameCount():int
        {
            return (_SafeStr_6227.length * _SafeStr_4406);
        }

        public function dispose():void
        {
            _SafeStr_5670 = [];
        }

        public function initialize():void
        {
            var _local_3:int;
            var _local_1:int = 1;
            var _local_2:int = -1;
            _local_3 = (_SafeStr_6227.length - 1);
            while (_local_3 >= 0)
            {
                if (_SafeStr_6227[_local_3] == _local_2)
                {
                    _local_1++;
                }
                else
                {
                    _local_2 = _SafeStr_6227[_local_3];
                    _local_1 = 1;
                };
                _SafeStr_6178[_local_3] = _local_1;
                _local_3--;
            };
        }

        public function addFrame(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:_SafeStr_3279):void
        {
            var _local_8:AnimationFrameData;
            var _local_7:int = 1;
            if (_SafeStr_5670.length > 0)
            {
                _local_8 = _SafeStr_5670[(_SafeStr_5670.length - 1)];
                if (((((((((_local_8.id == _arg_1) && (!(_local_8.hasDirectionalOffsets()))) && (_local_8.x == _arg_2)) && (_local_8.y == _arg_3)) && (_local_8.randomX == _arg_4)) && (_arg_4 == 0)) && (_local_8.randomY == _arg_5)) && (_arg_5 == 0)))
                {
                    _local_7 = (_local_7 + _local_8.repeats);
                    _SafeStr_5670.pop();
                };
            };
            var _local_9:AnimationFrameData;
            if (_arg_6 == null)
            {
                _local_9 = new AnimationFrameData(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _local_7);
            }
            else
            {
                _local_9 = new AnimationFrameDirectionalData(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _local_7);
            };
            _SafeStr_5670.push(_local_9);
            _SafeStr_6227.push((_SafeStr_5670.length - 1));
            _SafeStr_6178.push(1);
        }

        public function getFrame(_arg_1:int):AnimationFrameData
        {
            if ((((_SafeStr_5670.length == 0) || (_arg_1 < 0)) || (_arg_1 >= frameCount)))
            {
                return (null);
            };
            _arg_1 = _SafeStr_6227[(_arg_1 % _SafeStr_6227.length)];
            return (_SafeStr_5670[_arg_1] as AnimationFrameData);
        }

        public function getFrameIndex(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= frameCount)))
            {
                return (-1);
            };
            if (_SafeStr_6782)
            {
                _arg_1 = int((Math.random() * _SafeStr_6227.length));
                if (_arg_1 == _SafeStr_6227.length)
                {
                    _arg_1--;
                };
            };
            return (_arg_1);
        }

        public function getRepeats(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= frameCount)))
            {
                return (0);
            };
            return (_SafeStr_6178[(_arg_1 % _SafeStr_6178.length)]);
        }


    }
}//package com.sulake.habbo.room.object.visualization.data

// _SafeStr_3279 = "_-mC" (String#4432, DoABC#4)
// _SafeStr_4406 = "_-3V" (String#5530, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_6178 = "_-S1v" (String#5415, DoABC#4)
// _SafeStr_6227 = "_-91e" (String#3998, DoABC#4)
// _SafeStr_6782 = "_-Aq" (String#7180, DoABC#4)


