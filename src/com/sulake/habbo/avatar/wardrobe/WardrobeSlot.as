// by nota

//com.sulake.habbo.avatar.wardrobe.WardrobeSlot

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.IOutfit;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window.events._SafeStr_3116;

    public class WardrobeSlot implements IOutfit, _SafeStr_1875 
    {

        private var _SafeStr_4360:HabboAvatarEditor;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_4513:Boolean;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_6742:_SafeStr_3264;
        private var _SafeStr_5716:int;
        private var _SafeStr_4036:Boolean;

        public function WardrobeSlot(_arg_1:_SafeStr_3109, _arg_2:HabboAvatarEditor, _arg_3:int, _arg_4:Boolean, _arg_5:String=null, _arg_6:String=null)
        {
            _SafeStr_4360 = _arg_2;
            _SafeStr_5716 = _arg_3;
            createView(_arg_1);
            update(_arg_5, _arg_6, _arg_4);
        }

        public function get id():int
        {
            return (_SafeStr_5716);
        }

        public function update(_arg_1:String, _arg_2:String, _arg_3:Boolean):void
        {
            switch (_arg_2)
            {
                case "M":
                case "m":
                case "M":
                    _arg_2 = "M";
                    break;
                case "F":
                case "f":
                case "F":
                    _arg_2 = "F";
            };
            _SafeStr_3819 = _arg_1;
            _SafeStr_3834 = _arg_2;
            _SafeStr_4513 = _arg_3;
            updateView();
        }

        private function createView(_arg_1:_SafeStr_3109):void
        {
            _SafeStr_3882 = (_arg_1.clone() as _SafeStr_3133);
            _SafeStr_3882.procedure = eventHandler;
            _SafeStr_3882.visible = false;
            _SafeStr_6742 = (_SafeStr_3882.findChildByName("image") as _SafeStr_3264);
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            _SafeStr_3819 = null;
            _SafeStr_3834 = null;
            _SafeStr_6742 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function updateView():void
        {
            var _local_1:* = null;
            var _local_5:* = null;
            var _local_9:* = null;
            var _local_3:int;
            var _local_4:int;
            var _local_8:Boolean = true;
            var _local_6:Boolean = _SafeStr_4360.manager.getBoolean("zoom.enabled");
            if (((_SafeStr_3819) && (_SafeStr_4513)))
            {
                _local_5 = _SafeStr_4360.manager.avatarRenderManager.createAvatarImage(figure, ((_local_6) ? "h" : "sh"), _SafeStr_3834, this);
                if (_local_5)
                {
                    _local_5.setDirection("full", 4);
                    _local_1 = _local_5.getCroppedImage("full", ((_local_6) ? 0.5 : 1));
                    _local_5.dispose();
                };
            }
            else
            {
                _local_9 = (_SafeStr_4360.manager.windowManager.assets.getAssetByName("avatar_editor_wardrobe_empty_slot") as BitmapDataAsset);
                if (_local_9)
                {
                    _local_1 = (_local_9.content as BitmapData);
                    _local_8 = false;
                };
            };
            if (!_local_1)
            {
                return;
            };
            if (_SafeStr_6742)
            {
                if (_SafeStr_6742.bitmap)
                {
                    _SafeStr_6742.bitmap.dispose();
                };
                _SafeStr_6742.bitmap = new BitmapData(_SafeStr_6742.width, _SafeStr_6742.height, true, 0);
                _local_3 = int(((_SafeStr_6742.width - _local_1.width) / 2));
                _local_4 = int(((_SafeStr_6742.height - _local_1.height) / 2));
                _SafeStr_6742.bitmap.draw(_local_1, new Matrix(1, 0, 0, 1, _local_3, _local_4));
            };
            if (_local_8)
            {
                _local_1.dispose();
            };
            var _local_7:_SafeStr_3240 = (_SafeStr_3882.findChildByName("set_button") as _SafeStr_3240);
            if (_local_7)
            {
                _local_7.visible = _SafeStr_4513;
            };
            var _local_2:_SafeStr_3240 = (_SafeStr_3882.findChildByName("get_button") as _SafeStr_3240);
            if (_local_2)
            {
                _local_2.visible = ((_SafeStr_4513) && (!(_SafeStr_3819 == null)));
            };
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!_SafeStr_4360.verifyClubLevel())
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "set_button":
                    _SafeStr_3819 = _SafeStr_4360.figureData.getFigureString();
                    _SafeStr_3834 = _SafeStr_4360.gender;
                    _SafeStr_4360.handler.saveWardrobeOutfit(_SafeStr_5716, this);
                    updateView();
                    return;
                case "get_button":
                case "get_figure":
                    if (_SafeStr_3819)
                    {
                        _SafeStr_4360.setNftOutfit(null);
                        _SafeStr_4360.loadAvatarInEditor(_SafeStr_3819, _SafeStr_3834, _SafeStr_4360.clubMemberLevel);
                    };
                    return;
            };
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            updateView();
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4513 = "_-fy" (String#4293, DoABC#4)
// _SafeStr_5716 = "_-k1L" (String#6626, DoABC#4)
// _SafeStr_6742 = "_-a1A" (String#5188, DoABC#4)


