// by nota

//com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room._SafeStr_3248;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory._SafeStr_1708;

    public class BreedPetsResultView implements _SafeStr_13, _SafeStr_3140 
    {

        private static const ELEM_LIST:String = "element_list";
        private static const PREVIEW_LIST:String = "preview_list";
        private static const PREVIEW_BUTTONLIST:String = "preview_buttonlist";
        private static const ELEM_SEED1_ITEMLIST:String = "seed1_itemlist";
        private static const ELEM_SEED2_ITEMLIST:String = "seed2_itemlist";
        private static const ELEM_SEED1_BUTTONLIST:String = "seed1_buttonlist";
        private static const ELEM_SEED2_BUTTONLIST:String = "seed2_buttonlist";
        private static const _SafeStr_8955:String = "header_button_close";
        private static const _SafeStr_8701:String = "close_button";
        private static const _SafeStr_8703:String = "save_button";
        private static const ELEM_PLACE_BUTTON1:String = "place_button1";
        private static const ELEM_PLACE_BUTTON2:String = "place_button2";
        private static const ELEM_PICK_BUTTON1:String = "pick_button1";
        private static const ELEM_PICK_BUTTON2:String = "pick_button2";
        private static const ELEM_PREVIEW_IMAGE:String = "preview_image";
        private static const ELEM_PREVIEW_IMAGE2:String = "preview_image2";
        private static const _SafeStr_8956:String = "preview_image_region";
        private static const ELEM_PREVIEW_IMAGE_REGION2:String = "preview_image_region2";
        private static const ELEM_BUTTON_LIST:String = "button_list";
        private static const _SafeStr_8953:String = "description";
        private static const _SafeStr_8957:String = "description_sorry";
        private static const ELEM_INFO:String = "info";
        private static const _SafeStr_8958:String = "info_sorry";
        private static const ELEM_INFO_MUTATE1:String = "info_mutate1";
        private static const ELEM_INFO_MUTATE2:String = "info_mutate2";
        private static const _SafeStr_8704:String = "ok_button";

        private var _window:_SafeStr_3263;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:AvatarInfoWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _SafeStr_5989:_SafeStr_24;
        private var _SafeStr_5990:BreedPetsResultData;
        private var _resultData2:BreedPetsResultData;
        private var _SafeStr_5991:Boolean;

        public function BreedPetsResultView(_arg_1:AvatarInfoWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
            _SafeStr_5989 = new _SafeStr_24();
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
            if (_SafeStr_5989 != null)
            {
                _SafeStr_5989.dispose();
            };
            _SafeStr_5989 = null;
        }

        public function open(_arg_1:BreedPetsResultData, _arg_2:BreedPetsResultData):void
        {
            _SafeStr_5990 = _arg_1;
            _resultData2 = _arg_2;
            setWindowContent();
            show();
        }

        private function resolvePreviewImage(_arg_1:int, _arg_2:String):BitmapData
        {
            var _local_5:* = null;
            var _local_4:int;
            var _local_3:_SafeStr_3248 = _SafeStr_4981.handler.container.roomEngine.getFurnitureImage(_arg_1, new Vector3d(90, 0, 0), 64, this, 0, null, -1, -1, null);
            if (_local_3 != null)
            {
                _local_4 = _local_3.id;
                if (_local_4 > 0)
                {
                    _SafeStr_5989.add(_local_4, _arg_2);
                };
                _local_5 = _local_3.data;
            };
            return (_local_5);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            };
            var _local_3:String = _SafeStr_5989.getValue(_arg_1);
            if (_local_3 != null)
            {
                updatePreviewImage(_arg_2, _local_3);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function setWindowContent():void
        {
            var _local_3:* = null;
            var _local_1:_SafeStr_3130 = _SafeStr_4981.handler.container.sessionDataManager.getFloorItemData(_SafeStr_5990.classId);
            var _local_4:_SafeStr_3130 = _SafeStr_4981.handler.container.sessionDataManager.getFloorItemData(_resultData2.classId);
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed1.name", "name", ((_local_1 != null) ? _local_1.localizedName : ""));
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed2.name", "name", ((_local_4 != null) ? _local_4.localizedName : ""));
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed1.description", "name", _SafeStr_5990.userName);
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed2.description", "name", _resultData2.userName);
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed1.raritylevel", "level", _SafeStr_5990.rarityLevel.toString());
            _SafeStr_4981.localizations.registerParameter("breedpetsresult.widget.seed2.raritylevel", "level", _resultData2.rarityLevel.toString());
            var _local_7:int = _SafeStr_4981.handler.container.sessionDataManager.userId;
            var _local_5:* = (_SafeStr_5990.userId == _local_7);
            var _local_6:* = (_resultData2.userId == _local_7);
            var _local_2:Boolean = ((_local_5) || (_local_6));
            if (!_local_2)
            {
                _local_3 = "";
                if (((!(_SafeStr_5990.userName == null)) && (!(_SafeStr_5990.userName == ""))))
                {
                    _local_3 = _SafeStr_5990.userName;
                }
                else
                {
                    if (((!(_resultData2.userName == null)) && (!(_resultData2.userName == ""))))
                    {
                        _local_3 = _resultData2.userName;
                    };
                };
                _SafeStr_4981.localization.registerParameter("breedpetsresult.widget.text.sorry", "name", _local_3);
            };
            if (!_window)
            {
                _window = (_windowManager.buildFromXML((_assets.getAssetByName("breed_pets_result_xml").content as XML)) as _SafeStr_3263);
                addClickListener("header_button_close");
            };
            _window.center();
            _window.visible = true;
            enableElement("seed1_buttonlist", false);
            enableElement("seed2_buttonlist", false);
            enableElement("place_button1", false);
            enableElement("pick_button1", false);
            enableElement("place_button2", false);
            enableElement("pick_button2", false);
            enableElement("close_button", false);
            if (_local_5)
            {
                enableElement("place_button1", true);
                enableElement("seed1_buttonlist", true);
            };
            if (_local_6)
            {
                enableElement("place_button2", true);
                enableElement("seed2_buttonlist", true);
            };
            if (_local_2)
            {
                enableElement("preview_buttonlist", true);
            };
            enableElement("seed2_itemlist", true);
            if (_resultData2.stuffId == -1)
            {
                enableElement("seed2_itemlist", false);
            };
            enableElement("description", true);
            enableElement("info", true);
            enableElement("description_sorry", false);
            enableElement("info", false);
            enableElement("button_list", false);
            enableElement("close_button", false);
            if (!_local_2)
            {
                enableElement("preview_buttonlist", false);
                enableElement("description", false);
                enableElement("info", false);
                enableElement("save_button", false);
                enableElement("place_button1", false);
                enableElement("pick_button1", false);
                enableElement("place_button2", false);
                enableElement("pick_button2", false);
                enableElement("button_list", true);
                enableElement("description_sorry", true);
                enableElement("info_sorry", true);
                enableElement("close_button", true);
            };
            enableElement("info_mutate1", false);
            enableElement("info_mutate2", false);
            if (_SafeStr_5990.hasMutation)
            {
                enableElement("info_mutate1", true);
            };
            if (_resultData2.hasMutation)
            {
                enableElement("info_mutate2", true);
            };
            addClickListener("save_button");
            addClickListener("header_button_close");
            addClickListener("close_button");
            addClickListener("place_button1");
            addClickListener("place_button2");
            addClickListener("pick_button1");
            addClickListener("pick_button2");
            addClickListener("preview_image_region");
            addClickListener("preview_image_region2");
            var _local_8:BitmapData = resolvePreviewImage(_local_1.id, "preview_image");
            updatePreviewImage(((_local_8 != null) ? _local_8 : new BitmapData(10, 10)), "preview_image");
            _local_8 = resolvePreviewImage(_local_1.id, "preview_image2");
            updatePreviewImage(((_local_8 != null) ? _local_8 : new BitmapData(10, 10)), "preview_image2");
            arrangeListItems();
            _window.invalidate();
        }

        private function enableElement(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
            };
        }

        private function arrangeListItems():void
        {
            arrangeListItem("seed1_itemlist");
            arrangeListItem("seed2_itemlist");
            arrangeListItem("seed1_buttonlist");
            arrangeListItem("seed2_buttonlist");
            arrangeListItem("preview_buttonlist");
            arrangeListItem("button_list");
            arrangeListItem("preview_list");
            arrangeListItem("element_list");
            _window.resizeToFitContent();
        }

        private function arrangeListItem(_arg_1:String):void
        {
            var _local_2:IItemListWindow = (_window.findChildByName(_arg_1) as IItemListWindow);
            if (_local_2 != null)
            {
                _local_2.arrangeListItems();
            };
        }

        private function updatePreviewImage(_arg_1:BitmapData, _arg_2:String):void
        {
            var _local_5:* = null;
            if (((!(_window)) || (!(_arg_1))))
            {
                return;
            };
            var _local_6:_SafeStr_3264 = (_window.findChildByName(_arg_2) as _SafeStr_3264);
            _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height);
            var _local_3:IAsset = (_assets.getAssetByName("breed_pets_preview_bg_png") as IAsset);
            if (_local_3)
            {
                _local_5 = (_local_3.content as BitmapData);
                _local_6.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
            };
            var _local_4:Point = new Point(((_local_6.width - _arg_1.width) / 2), ((_local_6.height - _arg_1.height) / 2));
            _local_6.bitmap.copyPixels(_arg_1, _arg_1.rect, _local_4, null, null, true);
        }

        public function close():void
        {
            if (_SafeStr_4981)
            {
                _SafeStr_4981.removeBreedPetsResultView(this);
            };
        }

        public function show():void
        {
            _SafeStr_5991 = false;
            if (_window)
            {
                _window.visible = true;
            };
        }

        private function hide():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function addClickListener(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseClick);
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "close_button":
                    close();
                    return;
                case "place_button1":
                    _SafeStr_5991 = placeItemToRoom(_SafeStr_5990.stuffId);
                    if (_SafeStr_5991)
                    {
                        close();
                    };
                    return;
                case "place_button2":
                    _SafeStr_5991 = placeItemToRoom(_resultData2.stuffId);
                    if (_SafeStr_5991)
                    {
                        close();
                    };
                    return;
                case "pick_button1":
                    pickItemFromRoom(_SafeStr_5990.stuffId);
                    return;
                case "pick_button2":
                    pickItemFromRoom(_resultData2.stuffId);
                    return;
                case "preview_image_region":
                    selectItemFromInventoryOrRoom(_SafeStr_5990.stuffId);
                    return;
                case "preview_image_region2":
                    selectItemFromInventoryOrRoom(_resultData2.stuffId);
                    return;
                case "ok_button":
                    hide();
                    return;
                case "save_button":
                    hide();
                    return;
                default:
                    return;
            };
        }

        private function selectItemFromInventoryOrRoom(_arg_1:int):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:_SafeStr_3154 = findInventoryFloorItemById(_arg_1);
            if (_local_2 != null)
            {
                _SafeStr_4981.handler.container.inventory.toggleInventoryPage("furni");
                return (true);
            };
            var _local_3:IRoomObject = findRoomObject(_arg_1);
            if (_local_3 != null)
            {
                _local_4 = _SafeStr_4981.handler.container.roomSession.roomId;
                _local_5 = 10;
                _SafeStr_4981.handler.container.roomEngine.selectRoomObject(_local_4, _local_3.getId(), _local_5);
                return (true);
            };
            return (false);
        }

        private function pickItemFromRoom(_arg_1:int):Boolean
        {
            var _local_2:IRoomObject = findRoomObject(_arg_1);
            if (_local_2 != null)
            {
                _SafeStr_4981.handler.container.roomEngine.modifyRoomObject(_local_2.getId(), 10, "OBJECT_PICKUP");
                return (true);
            };
            return (false);
        }

        private function placeItemToRoom(_arg_1:int):Boolean
        {
            var _local_2:_SafeStr_3154 = findInventoryFloorItemById(_arg_1);
            return (requestSelectedFurniPlacement(_local_2));
        }

        private function findRoomObject(_arg_1:int):IRoomObject
        {
            var _local_3:int = _SafeStr_4981.handler.container.roomSession.roomId;
            var _local_4:int = 10;
            return (_SafeStr_4981.handler.container.roomEngine.getRoomObject(_local_3, _arg_1, _local_4));
        }

        private function findInventoryFloorItemById(_arg_1:int):_SafeStr_3154
        {
            if (_SafeStr_4981 == null)
            {
                return (null);
            };
            var _local_3:_SafeStr_1708 = _SafeStr_4981.handler.container.inventory;
            if (_local_3 == null)
            {
                return (null);
            };
            return (_local_3.getFloorItemById(-(_arg_1)));
        }

        private function requestSelectedFurniPlacement(_arg_1:_SafeStr_3154):Boolean
        {
            if (((_arg_1 == null) || (_SafeStr_4981 == null)))
            {
                return (false);
            };
            var _local_3:_SafeStr_1708 = _SafeStr_4981.handler.container.inventory;
            if (_local_3 == null)
            {
                return (false);
            };
            var _local_2:Boolean;
            if ((((_arg_1.category == 3) || (_arg_1.category == 2)) || (_arg_1.category == 4)))
            {
                _local_2 = false;
            }
            else
            {
                _local_2 = _local_3.requestSelectedFurniToMover(_arg_1);
            };
            return (_local_2);
        }

        public function roomObjectRemoved(_arg_1:int):void
        {
            if (((_SafeStr_5990 == null) || (_resultData2 == null)))
            {
                return;
            };
            if (((_SafeStr_5990.stuffId == _arg_1) || (_resultData2.stuffId == _arg_1)))
            {
                updatePlacingButtons();
                show();
            };
        }

        public function roomObjectAdded(_arg_1:int):void
        {
            if (((_SafeStr_5990 == null) || (_resultData2 == null)))
            {
                return;
            };
            if (((_SafeStr_5990.stuffId == _arg_1) || (_resultData2.stuffId == _arg_1)))
            {
                updatePlacingButtons();
                show();
            };
        }

        public function updatePlacingButtons():void
        {
            updateButtons(_SafeStr_5990, "place_button1", "pick_button1");
            updateButtons(_resultData2, "place_button2", "pick_button2");
            arrangeListItems();
        }

        private function updateButtons(_arg_1:BreedPetsResultData, _arg_2:String, _arg_3:String):void
        {
            var _local_5:* = null;
            if (((_window == null) || (_arg_1 == null)))
            {
                return;
            };
            var _local_10:int = _SafeStr_4981.handler.container.sessionDataManager.userId;
            var _local_4:* = (_arg_1.userId == _local_10);
            var _local_9:Boolean;
            var _local_8:Boolean;
            var _local_7:IRoomObject = findRoomObject(_arg_1.stuffId);
            if (_local_7 != null)
            {
                _local_8 = true;
            };
            if (!_local_8)
            {
                _local_5 = findInventoryFloorItemById(_arg_1.stuffId);
                if (_local_5 != null)
                {
                    _local_9 = true;
                };
            };
            var _local_6:_SafeStr_3109 = _window.findChildByName(_arg_2);
            var _local_11:_SafeStr_3109 = _window.findChildByName(_arg_3);
            if (_local_6 != null)
            {
                _local_6.visible = false;
                if (_local_4)
                {
                    if (_local_9)
                    {
                        _local_6.visible = true;
                    };
                    if (((!(_local_9)) && (!(_local_8))))
                    {
                        _local_6.visible = true;
                    };
                };
            };
            if (_local_11 != null)
            {
                _local_11.visible = false;
                if (_local_4)
                {
                    if (_local_8)
                    {
                        _local_11.visible = true;
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5989 = "_-o1c" (String#2112, DoABC#4)
// _SafeStr_5990 = "_-w1h" (String#3032, DoABC#4)
// _SafeStr_5991 = "_-X1R" (String#8226, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8953 = "_-d1Z" (String#24724, DoABC#4)
// _SafeStr_8955 = "_-31x" (String#32620, DoABC#4)
// _SafeStr_8956 = "_-n1R" (String#29636, DoABC#4)
// _SafeStr_8957 = "_-R1H" (String#41424, DoABC#4)
// _SafeStr_8958 = "_-lc" (String#32443, DoABC#4)


