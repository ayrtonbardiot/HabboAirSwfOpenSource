// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.wardrobe.Outfit

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.IOutfit;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar._SafeStr_3138;

    public class Outfit implements IOutfit, _SafeStr_1875 
    {

        private var _SafeStr_4360:HabboAvatarEditor;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_3882:OutfitView;
        private var _SafeStr_4036:Boolean;

        public function Outfit(_arg_1:HabboAvatarEditor, _arg_2:String, _arg_3:String)
        {
            _SafeStr_4360 = _arg_1;
            _SafeStr_3882 = new OutfitView(_arg_1.manager.windowManager, _arg_1.manager.assets, (!(_arg_2 == "")));
            switch (_arg_3)
            {
                case "M":
                case "m":
                case "M":
                    _arg_3 = "M";
                    break;
                case "F":
                case "f":
                case "F":
                    _arg_3 = "F";
            };
            _SafeStr_3819 = _arg_2;
            _SafeStr_3834 = _arg_3;
            update();
        }

        public function dispose():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _SafeStr_3819 = null;
            _SafeStr_3834 = null;
            _SafeStr_4036 = true;
            _SafeStr_4360 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function update():void
        {
            var _local_1:* = null;
            var _local_3:Boolean = _SafeStr_4360.manager.getBoolean("zoom.enabled");
            var _local_2:_SafeStr_3138 = _SafeStr_4360.manager.avatarRenderManager.createAvatarImage(figure, ((_local_3) ? "h" : "sh"), _SafeStr_3834, this);
            if (_local_2)
            {
                _local_2.setDirection("full", 4);
                _local_1 = _local_2.getImage("full", true, ((_local_3) ? 0.5 : 1));
                if (((_SafeStr_3882) && (_local_1)))
                {
                    _SafeStr_3882.update(_local_1);
                };
                _local_2.dispose();
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

        public function get view():OutfitView
        {
            return (_SafeStr_3882);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            update();
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


