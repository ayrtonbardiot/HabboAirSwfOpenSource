// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.cache._SafeStr_3424

package com.sulake.room.renderer.cache
{
    import com.sulake.room.renderer.utils._SafeStr_3417;

    [SecureSWF(rename="true")]
    public class _SafeStr_3424 
    {

        private var _SafeStr_4164:Array = [];
        private var _updateId1:int = -1;
        private var _updateId2:int = -1;
        private var _SafeStr_6681:Boolean = false;


        public function get spriteCount():int
        {
            return (_SafeStr_4164.length);
        }

        public function get isEmpty():Boolean
        {
            return (_SafeStr_6681);
        }

        public function dispose():void
        {
            setSpriteCount(0);
        }

        public function addSprite(_arg_1:_SafeStr_3417):void
        {
            _SafeStr_4164.push(_arg_1);
        }

        public function getSprite(_arg_1:int):_SafeStr_3417
        {
            return (_SafeStr_4164[_arg_1]);
        }

        public function get sprites():Array
        {
            return (_SafeStr_4164);
        }

        public function needsUpdate(_arg_1:int, _arg_2:int):Boolean
        {
            if (((!(_arg_1 == _updateId1)) || (!(_arg_2 == _updateId2))))
            {
                _updateId1 = _arg_1;
                _updateId2 = _arg_2;
                return (true);
            };
            return (false);
        }

        public function setSpriteCount(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = null;
            if (_arg_1 < _SafeStr_4164.length)
            {
                _local_3 = _arg_1;
                while (_local_3 < _SafeStr_4164.length)
                {
                    _local_2 = _SafeStr_4164[_local_3];
                    if (_local_2)
                    {
                        _local_2.dispose();
                    };
                    _local_3++;
                };
                _SafeStr_4164.splice(_arg_1, (_SafeStr_4164.length - _arg_1));
            };
            if (_SafeStr_4164.length == 0)
            {
                _SafeStr_6681 = true;
            }
            else
            {
                _SafeStr_6681 = false;
            };
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_3417 = "_-on" (String#3696, DoABC#4)
// _SafeStr_3424 = "_-G1G" (String#10137, DoABC#4)
// _SafeStr_4164 = "_-g0" (String#1517, DoABC#4)
// _SafeStr_6681 = "_-An" (String#13163, DoABC#4)


