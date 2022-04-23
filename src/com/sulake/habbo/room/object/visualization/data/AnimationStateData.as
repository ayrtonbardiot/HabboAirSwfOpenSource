// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.data.AnimationStateData

package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationStateData 
    {

        private var _SafeStr_6144:int = -1;
        private var _SafeStr_6145:int = 0;
        private var _SafeStr_4377:Boolean = false;
        private var _SafeStr_4238:int = 0;
        private var _SafeStr_5670:Array = [];
        private var _SafeStr_6146:Array = [];
        private var _SafeStr_6147:Array = [];
        private var _SafeStr_4169:int = 0;


        public function get animationOver():Boolean
        {
            return (_SafeStr_4377);
        }

        public function set animationOver(_arg_1:Boolean):void
        {
            _SafeStr_4377 = _arg_1;
        }

        public function get frameCounter():int
        {
            return (_SafeStr_4238);
        }

        public function set frameCounter(_arg_1:int):void
        {
            _SafeStr_4238 = _arg_1;
        }

        public function get animationId():int
        {
            return (_SafeStr_6144);
        }

        public function set animationId(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_6144)
            {
                _SafeStr_6144 = _arg_1;
                resetAnimationFrames(false);
            };
        }

        public function get animationAfterTransitionId():int
        {
            return (_SafeStr_6145);
        }

        public function set animationAfterTransitionId(_arg_1:int):void
        {
            _SafeStr_6145 = _arg_1;
        }

        public function dispose():void
        {
            recycleFrames();
            _SafeStr_5670 = null;
            _SafeStr_6146 = null;
            _SafeStr_6147 = null;
        }

        public function setLayerCount(_arg_1:int):void
        {
            _SafeStr_4169 = _arg_1;
            resetAnimationFrames();
        }

        public function resetAnimationFrames(_arg_1:Boolean=true):void
        {
            var _local_2:int;
            var _local_3:* = null;
            if (((_arg_1) || (_SafeStr_5670 == null)))
            {
                recycleFrames();
                _SafeStr_5670 = [];
            };
            _SafeStr_6146 = [];
            _SafeStr_6147 = [];
            _SafeStr_4377 = false;
            _SafeStr_4238 = 0;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4169)
            {
                if (((_arg_1) || (_SafeStr_5670.length <= _local_2)))
                {
                    _SafeStr_5670[_local_2] = null;
                }
                else
                {
                    _local_3 = _SafeStr_5670[_local_2];
                    if (_local_3 != null)
                    {
                        _local_3.recycle();
                        _SafeStr_5670[_local_2] = AnimationFrame.allocate(_local_3.id, _local_3.x, _local_3.y, _local_3.repeats, 0, _local_3.isLastFrame);
                    };
                };
                _SafeStr_6146[_local_2] = false;
                _SafeStr_6147[_local_2] = false;
                _local_2++;
            };
        }

        private function recycleFrames():void
        {
            if (_SafeStr_5670 != null)
            {
                for each (var _local_1:AnimationFrame in _SafeStr_5670)
                {
                    if (_local_1 != null)
                    {
                        _local_1.recycle();
                    };
                };
            };
        }

        public function getFrame(_arg_1:int):AnimationFrame
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                return (_SafeStr_5670[_arg_1]);
            };
            return (null);
        }

        public function setFrame(_arg_1:int, _arg_2:AnimationFrame):void
        {
            var _local_3:* = null;
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                _local_3 = _SafeStr_5670[_arg_1];
                if (_local_3 != null)
                {
                    _local_3.recycle();
                };
                _SafeStr_5670[_arg_1] = _arg_2;
            };
        }

        public function getAnimationPlayed(_arg_1:int):Boolean
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                return (_SafeStr_6147[_arg_1]);
            };
            return (true);
        }

        public function setAnimationPlayed(_arg_1:int, _arg_2:Boolean):void
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                _SafeStr_6147[_arg_1] = _arg_2;
            };
        }

        public function getLastFramePlayed(_arg_1:int):Boolean
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                return (_SafeStr_6146[_arg_1]);
            };
            return (true);
        }

        public function setLastFramePlayed(_arg_1:int, _arg_2:Boolean):void
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4169)))
            {
                _SafeStr_6146[_arg_1] = _arg_2;
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.data

// _SafeStr_4169 = "_-j4" (String#3264, DoABC#4)
// _SafeStr_4238 = "_-S1I" (String#4071, DoABC#4)
// _SafeStr_4377 = "_-G11" (String#5465, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_6144 = "_-A1l" (String#14117, DoABC#4)
// _SafeStr_6145 = "_-s1s" (String#18564, DoABC#4)
// _SafeStr_6146 = "_-Uh" (String#7458, DoABC#4)
// _SafeStr_6147 = "_-aV" (String#7314, DoABC#4)


