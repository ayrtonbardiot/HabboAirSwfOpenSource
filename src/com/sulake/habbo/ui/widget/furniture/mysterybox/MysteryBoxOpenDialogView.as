// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxOpenDialogView

package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.room.object.IRoomObject;
    import _-02s._SafeStr_567;
    import _-02s._SafeStr_657;
    import _-02s._SafeStr_794;
    import _-TT._SafeStr_1322;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.ISessionDataManager;
    import _-Cx._SafeStr_671;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.room._SafeStr_3248;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import _-j1G._SafeStr_558;
    import com.sulake.core.communication.connection.IConnection;

    public class MysteryBoxOpenDialogView implements _SafeStr_13, _SafeStr_3140 
    {

        private var _disposed:Boolean;
        private var _SafeStr_4981:FurnitureContextMenuWidget;
        private var _SafeStr_4003:IModalDialog;
        private var _window:_SafeStr_3133;
        private var _SafeStr_3984:IRoomObject;
        private var _SafeStr_6488:_SafeStr_567;
        private var _SafeStr_6489:_SafeStr_657;
        private var _SafeStr_6490:_SafeStr_794;
        private var _SafeStr_4891:int = -1;

        public function MysteryBoxOpenDialogView(_arg_1:FurnitureContextMenuWidget)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_6488 = new _SafeStr_567(onShowMysteryBoxWait);
            _SafeStr_6489 = new _SafeStr_657(onCancelMysteryBoxWait);
            _SafeStr_6490 = new _SafeStr_794(onGotMysteryBoxPrize);
            connection.addMessageEvent(_SafeStr_6488);
            connection.addMessageEvent(_SafeStr_6489);
            connection.addMessageEvent(_SafeStr_6490);
        }

        private function onShowMysteryBoxWait(_arg_1:_SafeStr_567):void
        {
            showWaitWindow();
        }

        private function onCancelMysteryBoxWait(_arg_1:_SafeStr_657):void
        {
            closeWindow();
        }

        private function onGotMysteryBoxPrize(_arg_1:_SafeStr_794):void
        {
            var _local_2:_SafeStr_1322 = _arg_1.getParser();
            showRewardWindow(_local_2.contentType, _local_2.classId);
        }

        private function showWaitWindow():void
        {
            closeWindow();
            var _local_1:XML = (_SafeStr_4981.assets.getAssetByName("mystery_box_open_dialog").content as XML);
            _SafeStr_4003 = _SafeStr_4981.handler.container.windowManager.buildModalDialogFromXML(_local_1);
            _window = (_SafeStr_4003.rootWindow as _SafeStr_3133);
            _window.procedure = waitWindowProcedure;
            var _local_4:Boolean = _SafeStr_4981.handler.container.isOwnerOfFurniture(_SafeStr_3984);
            var _local_5:String = ((_local_4) ? "mysterybox.dialog.owner." : "mysterybox.dialog.other.");
            _window.caption = (("${" + _local_5) + "title}");
            _window.findChildByName("subtitle_text").caption = (("${" + _local_5) + "subtitle}");
            _window.findChildByName("waiting_text").caption = (("${" + _local_5) + "waiting}");
            _window.findChildByName("cancel_button").caption = (("${" + _local_5) + "cancel}");
            IStaticBitmapWrapperWindow(_window.findChildByName("reward_base")).assetUri = ((_local_4) ? "mysterybox_box_base" : "mysterybox_key_base");
            IStaticBitmapWrapperWindow(_window.findChildByName("reward_overlay")).assetUri = ((_local_4) ? "mysterybox_box_overlay" : "mysterybox_key_overlay");
            IStaticBitmapWrapperWindow(_window.findChildByName("needed_base")).assetUri = ((_local_4) ? "mysterybox_key_base" : "mysterybox_box_base");
            IStaticBitmapWrapperWindow(_window.findChildByName("needed_overlay")).assetUri = ((_local_4) ? "mysterybox_key_overlay" : "mysterybox_box_overlay");
            var _local_6:ISessionDataManager = _SafeStr_4981.handler.container.sessionDataManager;
            var _local_2:String = ((_local_4) ? _local_6.mysteryBoxColor : _local_6.mysteryKeyColor);
            if (((_local_2 == null) || (_local_2 == "")))
            {
                return;
            };
            var _local_3:uint = MysteryBoxToolbarExtension.KEY_COLORS[_local_2.toLowerCase()];
            _window.findChildByName("reward_base").color = _local_3;
            _window.findChildByName("needed_base").color = _local_3;
        }

        private function waitWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    closeWindow();
                    connection.send(new _SafeStr_671(_SafeStr_4981.handler.container.getFurnitureOwnerId(_SafeStr_3984)));
                    return;
            };
        }

        private function showRewardWindow(_arg_1:String, _arg_2:int):void
        {
            closeWindow();
            var _local_3:XML = (_SafeStr_4981.assets.getAssetByName("mystery_box_reward").content as XML);
            _SafeStr_4003 = _SafeStr_4981.handler.container.windowManager.buildModalDialogFromXML(_local_3);
            _window = (_SafeStr_4003.rootWindow as _SafeStr_3133);
            _window.procedure = rewardWindowProcedure;
            _SafeStr_4891 = -1;
            var _local_4:_SafeStr_3248;
            switch (_arg_1)
            {
                case "s":
                    _local_4 = _SafeStr_4981.handler.container.roomEngine.getFurnitureImage(_arg_2, new Vector3d(90, 0, 0), 64, this, 0);
                    break;
                case "i":
                    _local_4 = _SafeStr_4981.handler.container.roomEngine.getWallItemImage(_arg_2, new Vector3d(90, 0, 0), 64, this, 0);
                    break;
                case "e":
                    rewardBitmap = _SafeStr_4981.handler.container.catalog.getPixelEffectIcon(_arg_2);
                    break;
                case "h":
                    rewardBitmap = _SafeStr_4981.handler.container.catalog.getSubscriptionProductIcon(_arg_2);
                    break;
                default:
                    return;
            };
            if (_local_4 != null)
            {
                if (_local_4.data != null)
                {
                    rewardBitmap = _local_4.data;
                };
                _SafeStr_4891 = _local_4.id;
            };
        }

        private function set rewardBitmap(_arg_1:BitmapData):void
        {
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("reward_image") as _SafeStr_3264);
            var _local_2:_SafeStr_3109 = _window.findChildByName("bitmap_container");
            _local_3.bitmap = _arg_1;
            _local_2.width = _arg_1.width;
            _local_2.height = _arg_1.height;
            _local_2.width++;
        }

        private function rewardWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "close_button":
                    closeWindow();
                    return;
            };
        }

        private function closeWindow():void
        {
            if (((!(_SafeStr_4003 == null)) && (!(_SafeStr_4003.disposed))))
            {
                _window = null;
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            closeWindow();
            connection.removeMessageEvent(_SafeStr_6488);
            connection.removeMessageEvent(_SafeStr_6489);
            connection.removeMessageEvent(_SafeStr_6490);
            _SafeStr_6488 = null;
            _SafeStr_6489 = null;
            _SafeStr_6490 = null;
            _SafeStr_3984 = null;
            _SafeStr_4981 = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function startOpenFlow(_arg_1:IRoomObject):void
        {
            _SafeStr_3984 = _arg_1;
            connection.send(new _SafeStr_558(_arg_1.getId()));
        }

        private function get connection():IConnection
        {
            return (_SafeStr_4981.handler.container.connection);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (_arg_1 == _SafeStr_4891)
            {
                _SafeStr_4891 = -1;
                rewardBitmap = _arg_2;
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.mysterybox

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1322 = "_-z1D" (String#33666, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4891 = "_-eo" (String#4899, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_567 = "_-tZ" (String#18464, DoABC#4)
// _SafeStr_6488 = "_-f8" (String#11302, DoABC#4)
// _SafeStr_6489 = "_-122" (String#10604, DoABC#4)
// _SafeStr_6490 = "_-W1Q" (String#10484, DoABC#4)
// _SafeStr_657 = "_-A1m" (String#18405, DoABC#4)
// _SafeStr_671 = "_-k1P" (String#31353, DoABC#4)
// _SafeStr_794 = "_-h1p" (String#17596, DoABC#4)


