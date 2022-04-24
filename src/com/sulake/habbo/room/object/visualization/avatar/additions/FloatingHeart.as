// by nota

//com.sulake.habbo.room.object.visualization.avatar.additions.FloatingHeart

package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingHeart extends ExpressionAddition 
    {

        private static const DELAY_BEFORE_ANIMATION:int = 300;
        private static const STATE_DELAY:int = 0;
        private static const STATE_FADE_IN:int = 1;
        private static const STATE_FLOAT:int = 2;
        private static const STATE_COMPLETE:int = 3;

        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _SafeStr_6582:Number = 0;
        private var _offsetY:int;
        private var _SafeStr_4045:Number;
        private var _SafeStr_3734:int = -1;

        public function FloatingHeart(_arg_1:int, _arg_2:int, _arg_3:AvatarVisualization)
        {
            super(_arg_1, _arg_2, _arg_3);
            _startTime = getTimer();
            _SafeStr_3734 = 0;
        }

        override public function animate(_arg_1:IRoomObjectSprite):Boolean
        {
            var _local_3:Number;
            var _local_2:int;
            if (!_arg_1)
            {
                return (false);
            };
            if (_asset)
            {
                _arg_1.asset = (_asset.content as BitmapData);
            };
            if (_SafeStr_3734 == 0)
            {
                if ((getTimer() - _startTime) < 300)
                {
                    return (false);
                };
                _SafeStr_3734 = 1;
                _arg_1.alpha = 0;
                _arg_1.visible = true;
                _SafeStr_6582 = 0;
                return (true);
            };
            if (_SafeStr_3734 == 1)
            {
                _SafeStr_6582 = (_SafeStr_6582 + 0.1);
                _arg_1.offsetY = _offsetY;
                _arg_1.alpha = (Math.pow(_SafeStr_6582, 0.9) * 0xFF);
                if (_SafeStr_6582 >= 1)
                {
                    _SafeStr_6582 = 0;
                    _arg_1.alpha = 0xFF;
                    _SafeStr_3734 = 2;
                };
                return (true);
            };
            if (_SafeStr_3734 == 2)
            {
                _local_3 = Math.pow(_SafeStr_6582, 0.9);
                _SafeStr_6582 = (_SafeStr_6582 + 0.05);
                _local_2 = ((_SafeStr_4045 < 48) ? -30 : -40);
                _arg_1.offsetY = (_offsetY + (((_SafeStr_6582 < 1) ? _local_3 : 1) * _local_2));
                _arg_1.alpha = ((1 - _local_3) * 0xFF);
                if (_arg_1.alpha <= 0)
                {
                    _arg_1.visible = false;
                    _SafeStr_3734 = 3;
                };
                return (true);
            };
            return (false);
        }

        override public function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void
        {
            var _local_3:int;
            var _local_5:Number;
            if (!_arg_1)
            {
                return;
            };
            _SafeStr_4045 = _arg_2;
            var _local_4:int = 64;
            if (_arg_2 < 48)
            {
                _asset = (_SafeStr_5586.getAvatarRendererAsset("user_blowkiss_small_png") as BitmapDataAsset);
                if (((_SafeStr_5586.angle == 90) || (_SafeStr_5586.angle == 270)))
                {
                    _local_3 = 0;
                }
                else
                {
                    if ((((_SafeStr_5586.angle == 135) || (_SafeStr_5586.angle == 180)) || (_SafeStr_5586.angle == 225)))
                    {
                        _local_3 = 6;
                    }
                    else
                    {
                        _local_3 = -6;
                    };
                };
                _offsetY = -38;
                _local_4 = 32;
            }
            else
            {
                _asset = (_SafeStr_5586.getAvatarRendererAsset("user_blowkiss_png") as BitmapDataAsset);
                if (((_SafeStr_5586.angle == 90) || (_SafeStr_5586.angle == 270)))
                {
                    _local_3 = -3;
                }
                else
                {
                    if ((((_SafeStr_5586.angle == 135) || (_SafeStr_5586.angle == 180)) || (_SafeStr_5586.angle == 225)))
                    {
                        _local_3 = 22;
                    }
                    else
                    {
                        _local_3 = -30;
                    };
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
                    _offsetY = (_offsetY + _local_4);
                };
            };
            if (_asset != null)
            {
                _arg_1.asset = (_asset.content as BitmapData);
                _arg_1.offsetX = _local_3;
                _arg_1.offsetY = _offsetY;
                _arg_1.relativeDepth = -0.02;
                _arg_1.alpha = 0;
                _local_5 = _SafeStr_6582;
                animate(_arg_1);
                _SafeStr_6582 = _local_5;
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_5586 = "_-d1n" (String#1081, DoABC#4)
// _SafeStr_6582 = "_-GQ" (String#2857, DoABC#4)


