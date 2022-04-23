// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.badge.BadgeEditorPartItem

package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.assets._SafeStr_3346;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import _-W1K._SafeStr_1578;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.core.assets.IAsset;
    import _-W1K._SafeStr_1581;
    import flash.geom.Point;

    public class BadgeEditorPartItem implements _SafeStr_13, _SafeStr_3346 
    {

        public static var BASE_PART:int = 0;
        public static var LAYER_PART:int = 1;
        public static var IMAGE_WIDTH:Number = 39;
        public static var IMAGE_HEIGHT:Number = 39;
        public static var CELL_WIDTH:Number = 13;
        public static var CELL_HEIGHT:Number = 13;

        private var _SafeStr_4144:HabboGroupsManager;
        private var _SafeStr_6570:BadgeSelectPartCtrl;
        private var _SafeStr_6568:int;
        private var _SafeStr_4028:int;
        private var _SafeStr_6567:String;
        private var _disposed:Boolean;
        private var _fileName:String;
        private var _maskFileName:String;
        private var _SafeStr_4204:BitmapData;
        private var _mask:BitmapData;
        private var _composite:BitmapData;
        private var _SafeStr_5882:ColorTransform = new ColorTransform(1, 1, 1);
        private var _SafeStr_6569:Boolean = false;
        private var _isLoaded:Boolean = false;
        private var _SafeStr_6571:Boolean = false;

        public function BadgeEditorPartItem(_arg_1:HabboGroupsManager, _arg_2:BadgeSelectPartCtrl, _arg_3:int, _arg_4:int, _arg_5:_SafeStr_1578=null)
        {
            _SafeStr_6568 = _arg_3;
            _SafeStr_4144 = _arg_1;
            _SafeStr_6570 = _arg_2;
            _SafeStr_4028 = _arg_4;
            _SafeStr_6567 = _SafeStr_4144.getProperty("image.library.badgepart.url");
            _composite = new BitmapData(IMAGE_WIDTH, IMAGE_HEIGHT);
            if (_arg_5 == null)
            {
                _isLoaded = true;
                _SafeStr_6571 = true;
                _SafeStr_4204 = _SafeStr_4144.getButtonImage("badge_part_empty");
            }
            else
            {
                _fileName = _arg_5.fileName.replace(".gif", "").replace(".png", "");
                _maskFileName = _arg_5.maskFileName.replace(".gif", "").replace(".png", "");
                _SafeStr_6569 = (_maskFileName.length > 0);
                _composite = new BitmapData(IMAGE_WIDTH, IMAGE_HEIGHT);
                _fileName = (((_SafeStr_6567 + "badgepart_") + _fileName) + ".png");
                _maskFileName = (((_SafeStr_6567 + "badgepart_") + _maskFileName) + ".png");
                _SafeStr_4144.windowManager.resourceManager.retrieveAsset(_fileName, this);
                _SafeStr_4144.windowManager.resourceManager.retrieveAsset(_maskFileName, this);
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get partIndex():int
        {
            return (_SafeStr_6568);
        }

        public function receiveAsset(_arg_1:IAsset, _arg_2:String):void
        {
            var _local_3:IResourceManager = _SafeStr_4144.windowManager.resourceManager;
            if (_local_3.isSameAsset(_fileName, _arg_2))
            {
                _SafeStr_4204 = (_arg_1.content as BitmapData);
            };
            if (_local_3.isSameAsset(_maskFileName, _arg_2))
            {
                _mask = (_arg_1.content as BitmapData);
            };
            checkIsImageLoaded();
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4204)
                {
                    _SafeStr_4204.dispose();
                    _SafeStr_4204 = null;
                };
                if (_mask)
                {
                    _mask.dispose();
                    _mask = null;
                };
                if (_composite)
                {
                    _composite.dispose();
                    _composite = null;
                };
                _fileName = null;
                _maskFileName = null;
                _SafeStr_5882 = null;
                _SafeStr_6570 = null;
                _SafeStr_4144 = null;
                _disposed = true;
            };
        }

        private function checkIsImageLoaded():void
        {
            if (_SafeStr_4204 == null)
            {
                return;
            };
            if (((_SafeStr_6569) && (_mask == null)))
            {
                return;
            };
            _isLoaded = true;
            if (_SafeStr_4028 == BASE_PART)
            {
                _SafeStr_6570.onBaseImageLoaded(this);
            }
            else
            {
                _SafeStr_6570.onLayerImageLoaded(this);
            };
        }

        public function getComposite(_arg_1:BadgeLayerOptions):BitmapData
        {
            if (!_isLoaded)
            {
                return (null);
            };
            if (_SafeStr_6571)
            {
                return (_SafeStr_4204);
            };
            var _local_2:_SafeStr_1581 = (_SafeStr_4144.guildEditorData.badgeColors[_arg_1.colorIndex] as _SafeStr_1581);
            _SafeStr_5882.redMultiplier = (_local_2.red / 0xFF);
            _SafeStr_5882.greenMultiplier = (_local_2.green / 0xFF);
            _SafeStr_5882.blueMultiplier = (_local_2.blue / 0xFF);
            var _local_3:Point = getPosition(_arg_1);
            _composite.dispose();
            _composite = new BitmapData(IMAGE_WIDTH, IMAGE_HEIGHT, true, 0);
            _composite.copyPixels(_SafeStr_4204, _SafeStr_4204.rect, _local_3);
            _composite.colorTransform(_composite.rect, _SafeStr_5882);
            if (_SafeStr_6569)
            {
                _composite.copyPixels(_mask, _mask.rect, _local_3, null, null, true);
            };
            return (_composite);
        }

        private function getPosition(_arg_1:BadgeLayerOptions):Point
        {
            var _local_2:Number = (((CELL_WIDTH * _arg_1.gridX) + (CELL_WIDTH / 2)) - (_SafeStr_4204.width / 2));
            var _local_3:Number = (((CELL_HEIGHT * _arg_1.gridY) + (CELL_HEIGHT / 2)) - (_SafeStr_4204.height / 2));
            if (_local_2 < 0)
            {
                _local_2 = 0;
            };
            if ((_local_2 + _SafeStr_4204.width) > IMAGE_WIDTH)
            {
                _local_2 = (IMAGE_WIDTH - _SafeStr_4204.width);
            };
            if (_local_3 < 0)
            {
                _local_3 = 0;
            };
            if ((_local_3 + _SafeStr_4204.height) > IMAGE_HEIGHT)
            {
                _local_3 = (IMAGE_HEIGHT - _SafeStr_4204.height);
            };
            return (new Point(Math.floor(_local_2), Math.floor(_local_3)));
        }


    }
}//package com.sulake.habbo.groups.badge

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1578 = "_-h5" (String#24252, DoABC#4)
// _SafeStr_1581 = "_-A1O" (String#5922, DoABC#4)
// _SafeStr_3346 = "_-p1W" (String#8896, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)
// _SafeStr_6567 = "_-po" (String#14956, DoABC#4)
// _SafeStr_6568 = "_-v1D" (String#7081, DoABC#4)
// _SafeStr_6569 = "_-9a" (String#15701, DoABC#4)
// _SafeStr_6570 = "_-QJ" (String#2461, DoABC#4)
// _SafeStr_6571 = "_-s1E" (String#5514, DoABC#4)


