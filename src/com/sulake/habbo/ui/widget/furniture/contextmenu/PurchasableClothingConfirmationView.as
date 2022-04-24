// by nota

//com.sulake.habbo.ui.widget.furniture.contextmenu.PurchasableClothingConfirmationView

package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.room.object.IRoomObject;
    import __AS3__.vec.Vector;
    import _-3W._SafeStr_638;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import _-L1z._SafeStr_172;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class PurchasableClothingConfirmationView implements _SafeStr_13 
    {

        private static const PRODUCT_PAGE_UKNOWN:int = -1;
        private static const PRODUCT_PAGE_CLOTHING:int = 0;
        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8703:String = "save_button";
        private static const _SafeStr_8961:String = "cancel_text";
        private static const _SafeStr_8704:String = "ok_button";
        private static const _SafeStr_9016:String = "avatar_preview";

        private var _window:_SafeStr_3133;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:FurnitureContextMenuWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _SafeStr_5499:int = -1;
        private var _SafeStr_3867:_SafeStr_3130;
        private var _newFigureString:String;

        public function PurchasableClothingConfirmationView(_arg_1:FurnitureContextMenuWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function open(_arg_1:int):void
        {
            var _local_7:* = null;
            var _local_5:int = _SafeStr_4981.handler.roomSession.roomId;
            var _local_6:IRoomObject = _SafeStr_4981.handler.roomEngine.getRoomObject(_local_5, _arg_1, 10);
            if (_local_6 != null)
            {
                _SafeStr_3867 = _SafeStr_4981.handler.getFurniData(_local_6);
                _SafeStr_5499 = _local_6.getId();
            }
            else
            {
                return;
            };
            var _local_3:int = -1;
            var _local_2:Vector.<int> = new Vector.<int>(0);
            switch (_SafeStr_3867.category)
            {
                case 23:
                    _local_3 = 0;
                    _local_7 = _SafeStr_3867.customParams.split(",");
                    for each (var _local_4:String in _local_7)
                    {
                        if (_SafeStr_4981.handler.container.avatarRenderManager.isValidFigureSetForGender(parseInt(_local_4), _SafeStr_4981.handler.container.sessionDataManager.gender))
                        {
                            _local_2.push(parseInt(_local_4));
                        };
                    };
                    break;
                default:
                    _SafeStr_14.log(("[PurchasableClothingConfirmationView.open()] Unsupported furniture category: " + _SafeStr_3867.category));
            };
            _newFigureString = _SafeStr_4981.handler.container.avatarRenderManager.getFigureStringWithFigureIds(_SafeStr_4981.handler.container.sessionDataManager.figure, _SafeStr_4981.handler.container.sessionDataManager.gender, _local_2);
            if (_SafeStr_4981.handler.container.inventory.hasBoundFigureSetFurniture(_SafeStr_3867.className))
            {
                _SafeStr_4981.handler.container.connection.send(new _SafeStr_638(_newFigureString, _SafeStr_4981.handler.container.sessionDataManager.gender));
            }
            else
            {
                setWindowContent(_local_3);
                _window.visible = true;
            };
        }

        private function setWindowContent(_arg_1:int):void
        {
            var _local_3:* = null;
            _SafeStr_4981.localizations.registerParameter("useproduct.widget.title.bind_clothing", "name", _SafeStr_3867.localizedName);
            if (!_window)
            {
                _local_3 = "use_product_widget_frame_plant_seed_xml";
                _window = (_windowManager.buildFromXML((_assets.getAssetByName(_local_3).content as XML)) as _SafeStr_3133);
                addClickListener("header_button_close");
                _window.center();
            };
            _window.caption = "${useproduct.widget.title.bind_clothing}";
            _SafeStr_4981.localizations.registerParameter("useproduct.widget.text.bind_clothing", "productName", _SafeStr_3867.localizedName);
            var _local_2:_SafeStr_3263 = (_window as _SafeStr_3263);
            _local_2.content.removeChildAt(0);
            var _local_4:_SafeStr_3133 = createWindow(_arg_1);
            _local_2.content.addChild(_local_4);
            switch (_arg_1)
            {
                case 0:
                    addClickListener("save_button");
                    addClickListener("cancel_text");
                    break;
                default:
                    throw (new Error(("Invalid type for use product confirmation content apply: " + _arg_1)));
            };
            refreshAvatar();
            _window.invalidate();
        }

        private function createWindow(_arg_1:int):_SafeStr_3133
        {
            var _local_2:* = null;
            var _local_3:* = null;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = _assets.getAssetByName("use_product_controller_purchasable_clothing_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for view content creation: " + _arg_1)));
            };
            return (_windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
        }

        private function refreshAvatar():void
        {
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("avatar_preview"));
            var _local_2:_SafeStr_3289 = _SafeStr_3289(_local_1.widget);
            _local_2.figure = _newFigureString;
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
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_text":
                case "ok_button":
                    close();
                    return;
                case "save_button":
                    _SafeStr_4981.handler.container.connection.send(new _SafeStr_172(_SafeStr_5499));
                    _SafeStr_4981.handler.container.connection.send(new _SafeStr_638(_newFigureString, _SafeStr_4981.handler.container.sessionDataManager.gender));
                    close();
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.contextmenu

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_172 = "_-v1u" (String#29057, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5499 = "_-11K" (String#5151, DoABC#4)
// _SafeStr_638 = "_-p1r" (String#11735, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8961 = "_-P1x" (String#12057, DoABC#4)
// _SafeStr_9016 = "_-vS" (String#34427, DoABC#4)


