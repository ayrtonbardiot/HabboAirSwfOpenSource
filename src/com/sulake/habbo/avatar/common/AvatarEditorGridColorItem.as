// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.common.AvatarEditorGridColorItem

package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;

    public class AvatarEditorGridColorItem 
    {

        private static const SELECTED_ASSET:String = "avatar_editor_editor_clr_13x21_3";
        private static const UNSELECTED_ASSET:String = "avatar_editor_editor_clr_13x21_1";
        private static const COLORIZATION_ASSET:String = "avatar_editor_editor_clr_13x21_2";

        private var _SafeStr_4619:_SafeStr_3301;
        private var _window:_SafeStr_3133;
        private var _partColor:IPartColor;
        private var _SafeStr_4617:Boolean = false;
        private var _SafeStr_5484:IStaticBitmapWrapperWindow;
        private var _isDisabledForWearing:Boolean;

        public function AvatarEditorGridColorItem(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_3301, _arg_3:IPartColor, _arg_4:Boolean=false)
        {
            _SafeStr_4619 = _arg_2;
            _window = _arg_1;
            _partColor = _arg_3;
            _isDisabledForWearing = _arg_4;
            _SafeStr_5484 = (_window.findChildByTag("BORDER") as IStaticBitmapWrapperWindow);
            setupColor();
            updateThumbData();
            _window.addEventListener("WME_OVER", onMouseOver);
            _window.addEventListener("WME_OUT", onMouseOut);
        }

        private function onMouseOut(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5484.assetUri = ((_SafeStr_4617) ? "avatar_editor_editor_clr_13x21_3" : "avatar_editor_editor_clr_13x21_1");
        }

        private function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5484.assetUri = "avatar_editor_editor_clr_13x21_3";
        }

        private function setupColor():void
        {
            var _local_1:BitmapDataAsset = (_SafeStr_4619.controller.manager.windowManager.assets.getAssetByName("avatar_editor_editor_clr_13x21_2") as BitmapDataAsset);
            var _local_2:BitmapData = (_local_1.content as BitmapData);
            var _local_3:BitmapData = _local_2.clone();
            var _local_4:_SafeStr_3264 = (_window.findChildByTag("COLOR_IMAGE") as _SafeStr_3264);
            _local_4.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
            _local_3.colorTransform(_local_3.rect, _partColor.colorTransform);
            _local_4.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
            _local_3.dispose();
        }

        public function dispose():void
        {
            _SafeStr_4619 = null;
            if (_window != null)
            {
                if (!_window.disposed)
                {
                    _window.dispose();
                };
            };
            _window = null;
            _partColor = null;
        }

        public function get view():_SafeStr_3133
        {
            return (_window);
        }

        public function get isSelected():Boolean
        {
            return (_SafeStr_4617);
        }

        public function set isSelected(_arg_1:Boolean):void
        {
            _SafeStr_4617 = _arg_1;
            _SafeStr_5484.assetUri = ((_SafeStr_4617) ? "avatar_editor_editor_clr_13x21_3" : "avatar_editor_editor_clr_13x21_1");
        }

        private function updateThumbData():void
        {
            if (_window == null)
            {
                return;
            };
            if (_window.disposed)
            {
                return;
            };
            _SafeStr_5484.assetUri = "avatar_editor_editor_clr_13x21_3";
            var _local_1:_SafeStr_3109 = _window.findChildByTag("CLUB_ICON");
            if (_partColor)
            {
                _local_1.visible = (_partColor.clubLevel > 0);
            }
            else
            {
                _local_1.visible = false;
            };
        }

        public function get partColor():IPartColor
        {
            return (_partColor);
        }

        public function get isDisabledForWearing():Boolean
        {
            return (_isDisabledForWearing);
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)


