// by nota

//com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedConfirmationView

package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.room.object.IRoomObject;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MonsterPlantSeedConfirmationView implements _SafeStr_13, _SafeStr_3140 
    {

        private static const PRODUCT_PAGE_UKNOWN:int = -1;
        private static const PRODUCT_PAGE_SEED:int = 0;
        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8703:String = "save_button";
        private static const _SafeStr_8961:String = "cancel_text";
        private static const _SafeStr_8704:String = "ok_button";

        private var _window:_SafeStr_3133;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:FurnitureContextMenuWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _SafeStr_5499:int = -1;
        private var _SafeStr_4720:int;
        private var _SafeStr_3867:_SafeStr_3130;

        public function MonsterPlantSeedConfirmationView(_arg_1:FurnitureContextMenuWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4036 = true;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_3867 = null;
        }

        public function open(_arg_1:int):void
        {
            var _local_3:int = _SafeStr_4981.handler.roomSession.roomId;
            var _local_4:IRoomObject = _SafeStr_4981.handler.roomEngine.getRoomObject(_local_3, _arg_1, 10);
            if (_local_4 != null)
            {
                _SafeStr_3867 = _SafeStr_4981.handler.getFurniData(_local_4);
                _SafeStr_5499 = _local_4.getId();
            };
            var _local_2:int = -1;
            switch (_SafeStr_3867.category)
            {
                case 19:
                    _local_2 = 0;
                    break;
                default:
                    _SafeStr_14.log(("[PlantSeedConfirmationView.open()] Unsupported furniture category: " + _SafeStr_3867.category));
            };
            setWindowContent(_local_2);
            _window.visible = true;
        }

        private function setWindowContent(_arg_1:int):void
        {
            var _local_4:* = null;
            var _local_3:BitmapData = new BitmapData(10, 10);
            _SafeStr_4981.localizations.registerParameter("useproduct.widget.title.plant_seed", "name", _SafeStr_3867.localizedName);
            if (!_window)
            {
                _local_4 = "use_product_widget_frame_plant_seed_xml";
                _window = (_windowManager.buildFromXML((_assets.getAssetByName(_local_4).content as XML)) as _SafeStr_3133);
                addClickListener("header_button_close");
                _window.center();
            };
            _SafeStr_4981.localizations.registerParameter("useproduct.widget.text.plant_seed", "productName", _SafeStr_3867.localizedName);
            var _local_2:_SafeStr_3263 = (_window as _SafeStr_3263);
            _local_2.content.removeChildAt(0);
            var _local_5:_SafeStr_3133 = createWindow(_arg_1);
            _local_2.content.addChild(_local_5);
            switch (_arg_1)
            {
                case 0:
                    addClickListener("save_button");
                    addClickListener("cancel_text");
                    _local_3 = resolvePreviewImage(_SafeStr_3867);
                    break;
                default:
                    throw (new Error(("Invalid type for use product confirmation content apply: " + _arg_1)));
            };
            updatePreviewImage(_local_3);
            _window.invalidate();
        }

        private function createWindow(_arg_1:int):_SafeStr_3133
        {
            var _local_2:* = null;
            var _local_3:* = null;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = _assets.getAssetByName("use_product_controller_plant_seed_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for view content creation: " + _arg_1)));
            };
            return (_windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
        }

        private function resolvePreviewImage(_arg_1:_SafeStr_3130):BitmapData
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (!_arg_1)
            {
                return (null);
            };
            var _local_2:Array = _arg_1.customParams.split(" ");
            switch (_arg_1.category)
            {
                case 19:
                    _local_3 = _SafeStr_4981.handler.roomEngine.getFurnitureImage(_SafeStr_3867.id, new Vector3d(90, 0, 0), 64, this, 0, "", -1, -1, null);
                    break;
                default:
                    _SafeStr_14.log(("[PlantSeedConfirmationView] Unsupported furniture category: " + _arg_1.category));
            };
            if (_local_3 != null)
            {
                _SafeStr_4720 = _local_3.id;
                _local_4 = _local_3.data;
            };
            return (_local_4);
        }

        private function updatePreviewImage(_arg_1:BitmapData):void
        {
            if (((!(_window)) || (!(_arg_1))))
            {
                return;
            };
            setPreviewImage("preview_image_bg");
            setPreviewImage("preview_image");
        }

        private function setPreviewImage(_arg_1:String):void
        {
            if (!_window)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName(_arg_1) as _SafeStr_3264);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:BitmapDataAsset = (_assets.getAssetByName(_local_2.bitmapAssetName) as BitmapDataAsset);
            if (_local_3 == null)
            {
                return;
            };
            _local_2.disposesBitmap = false;
            _local_2.bitmap = (_local_3.content as BitmapData);
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        private function addClickListener(_arg_1:String):void
        {
            _window.findChildByName(_arg_1).addEventListener("WME_CLICK", onMouseClick);
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_text":
                case "ok_button":
                    close();
                    break;
                case "save_button":
                    _local_2 = new RoomWidgetUseProductMessage("RWUPM_MONSTERPLANT_SEED", _SafeStr_5499);
                    close();
            };
            if (_local_2)
            {
                _SafeStr_4981.messageListener.processWidgetMessage(_local_2);
            };
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4720 == _arg_1)
            {
                updatePreviewImage(_arg_2);
                _SafeStr_4720 = 0;
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.contextmenu

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4720 = "_-q1e" (String#2637, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5499 = "_-11K" (String#5151, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8961 = "_-P1x" (String#12057, DoABC#4)


