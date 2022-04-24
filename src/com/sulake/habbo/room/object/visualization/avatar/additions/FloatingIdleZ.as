// by nota

//com.sulake.habbo.room.object.visualization.avatar.additions.FloatingIdleZ

package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingIdleZ implements IAvatarAddition 
    {

        private static const DELAY_BEFORE_ANIMATION:int = 2000;
        private static const DELAY_PER_FRAME:int = 2000;
        private static const STATE_DELAY:int = 0;
        private static const STATE_FRAME_A:int = 1;
        private static const STATE_FRAME_B:int = 2;

        protected var _SafeStr_3820:int;
        protected var _SafeStr_5586:AvatarVisualization;
        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _offsetY:int;
        private var _SafeStr_4045:Number;
        private var _SafeStr_3734:int = -1;

        public function FloatingIdleZ(_arg_1:int, _arg_2:AvatarVisualization)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_5586 = _arg_2;
            _startTime = getTimer();
            _SafeStr_3734 = 0;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5586 == null);
        }

        public function dispose():void
        {
            _SafeStr_5586 = null;
            _asset = null;
        }

        protected function getAssetNameForFrame(_arg_1:int):String
        {
            var _local_2:String = "left";
            if (((((_SafeStr_5586.angle == 135) || (_SafeStr_5586.angle == 180)) || (_SafeStr_5586.angle == 225)) || (_SafeStr_5586.angle == 270)))
            {
                _local_2 = "right";
            };
            return ((((("user_idle_" + _local_2) + "_") + _arg_1) + ((_SafeStr_4045 < 48) ? "_small" : "")) + "_png");
        }

        public function animate(_arg_1:IRoomObjectSprite):Boolean
        {
            if (!_arg_1)
            {
                return (false);
            };
            if (_SafeStr_3734 == 0)
            {
                if ((getTimer() - _startTime) >= 2000)
                {
                    _SafeStr_3734 = 1;
                    _startTime = getTimer();
                    _asset = (_SafeStr_5586.getAvatarRendererAsset(getAssetNameForFrame(1)) as BitmapDataAsset);
                };
            };
            if (_SafeStr_3734 == 1)
            {
                if ((getTimer() - _startTime) >= 2000)
                {
                    _SafeStr_3734 = 2;
                    _startTime = getTimer();
                    _asset = (_SafeStr_5586.getAvatarRendererAsset(getAssetNameForFrame(2)) as BitmapDataAsset);
                };
            };
            if (_SafeStr_3734 == 2)
            {
                if ((getTimer() - _startTime) >= 2000)
                {
                    _SafeStr_3734 = 1;
                    _startTime = getTimer();
                    _asset = (_SafeStr_5586.getAvatarRendererAsset(getAssetNameForFrame(1)) as BitmapDataAsset);
                };
            };
            if (_asset)
            {
                _arg_1.asset = (_asset.content as BitmapData);
                _arg_1.alpha = 0xFF;
                _arg_1.visible = true;
            }
            else
            {
                _arg_1.visible = false;
            };
            return (false);
        }

        public function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void
        {
            var _local_3:int;
            if (!_arg_1)
            {
                return;
            };
            _SafeStr_4045 = _arg_2;
            _asset = (_SafeStr_5586.getAvatarRendererAsset(getAssetNameForFrame(((_SafeStr_3734 == 1) ? 1 : 2))) as BitmapDataAsset);
            var _local_4:int = 64;
            if (_arg_2 < 48)
            {
                if (((((_SafeStr_5586.angle == 135) || (_SafeStr_5586.angle == 180)) || (_SafeStr_5586.angle == 225)) || (_SafeStr_5586.angle == 270)))
                {
                    _local_3 = 10;
                }
                else
                {
                    _local_3 = -16;
                };
                _offsetY = -38;
                _local_4 = 32;
            }
            else
            {
                if (((((_SafeStr_5586.angle == 135) || (_SafeStr_5586.angle == 180)) || (_SafeStr_5586.angle == 225)) || (_SafeStr_5586.angle == 270)))
                {
                    _local_3 = 22;
                }
                else
                {
                    _local_3 = -30;
                };
                _offsetY = -70;
            };
            if (_SafeStr_5586.posture == "sit")
            {
                _offsetY = (_offsetY + (_local_4 / 2));
            }
            else
            {
                if (_SafeStr_5586.posture == "lay")
                {
                    _offsetY = (_offsetY + (_local_4 - (0.3 * _local_4)));
                };
            };
            if (_asset != null)
            {
                _arg_1.asset = (_asset.content as BitmapData);
                _arg_1.offsetX = _local_3;
                _arg_1.offsetY = _offsetY;
                _arg_1.relativeDepth = -0.02;
                _arg_1.alpha = 0;
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_5586 = "_-d1n" (String#1081, DoABC#4)


