// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.Animation

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;

    public class Animation implements _SafeStr_13 
    {

        private var _SafeStr_5234:_SafeStr_3264;
        private var _SafeStr_5236:int;
        private var _SafeStr_5235:Boolean;
        private var _SafeStr_4164:Array = [];

        public function Animation(_arg_1:_SafeStr_3264)
        {
            _SafeStr_5234 = _arg_1;
            _SafeStr_5234.visible = false;
            if (_arg_1.bitmap == null)
            {
                _arg_1.bitmap = new BitmapData(_arg_1.width, _arg_1.height, true, 0);
            };
        }

        public function dispose():void
        {
            _SafeStr_5234 = null;
            if (_SafeStr_4164)
            {
                for each (var _local_1:AnimationObject in _SafeStr_4164)
                {
                    _local_1.dispose();
                };
                _SafeStr_4164 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5234 == null);
        }

        public function addObject(_arg_1:AnimationObject):void
        {
            _SafeStr_4164.push(_arg_1);
        }

        public function stop():void
        {
            _SafeStr_5235 = false;
            _SafeStr_5234.visible = false;
        }

        public function restart():void
        {
            _SafeStr_5236 = 0;
            _SafeStr_5235 = true;
            for each (var _local_1:AnimationObject in _SafeStr_4164)
            {
                _local_1.onAnimationStart();
            };
            draw();
            _SafeStr_5234.visible = true;
        }

        public function update(_arg_1:uint):void
        {
            if (_SafeStr_5235)
            {
                _SafeStr_5236 = (_SafeStr_5236 + _arg_1);
                draw();
            };
        }

        private function draw():void
        {
            var _local_1:Boolean;
            var _local_3:* = null;
            _SafeStr_5234.bitmap.fillRect(_SafeStr_5234.bitmap.rect, 0);
            if (_SafeStr_5235)
            {
                _local_1 = false;
                for each (var _local_2:AnimationObject in _SafeStr_4164)
                {
                    if (!_local_2.isFinished(_SafeStr_5236))
                    {
                        _local_1 = true;
                        _local_3 = _local_2.getBitmap(_SafeStr_5236);
                        if (_local_3 != null)
                        {
                            _SafeStr_5234.bitmap.copyPixels(_local_3, _local_3.rect, _local_2.getPosition(_SafeStr_5236));
                        };
                    };
                };
            };
            _SafeStr_5234.invalidate();
            _SafeStr_5235 = _local_1;
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4164 = "_-g0" (String#1517, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_5235 = "_-Z1W" (String#8082, DoABC#4)
// _SafeStr_5236 = "_-tR" (String#8638, DoABC#4)


