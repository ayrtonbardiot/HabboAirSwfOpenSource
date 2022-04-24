// by nota

//com.sulake.habbo.ui.widget.furniture.mannequin.MannequinWidget

package com.sulake.habbo.ui.widget.furniture.mannequin
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler.MannequinWidgetHandler;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.avatar._SafeStr_3164;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.ITextWindow;
    import _-02a._SafeStr_772;
    import _-02a._SafeStr_907;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import _-j1G._SafeStr_558;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MannequinWidget extends RoomWidgetBase 
    {

        private static const CONTENT_CONTROLLER_MAIN:int = 0;
        private static const CONTENT_CONTROLLER_UPDATE:int = 1;
        private static const CONTENT_PEER_MAIN:int = 2;
        private static const CONTENT_NO_CLUB:int = 3;
        private static const CONTENT_WRONG_GENDER:int = 4;
        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8703:String = "save_button";
        private static const _SafeStr_9020:String = "wear_button";
        private static const _SafeStr_9021:String = "configure_button";
        private static const _SafeStr_9022:String = "get_club_button";
        private static const _SafeStr_8961:String = "cancel_text";
        private static const _SafeStr_9023:String = "back_region";
        private static const _SafeStr_8704:String = "ok_button";
        private static const ELEM_OUTFIT_NAME_SET:String = "outfit_name_set";
        private static const _SafeStr_9024:String = "outfit_name_show";
        private static const NAME_STATE_HINT:int = 0;
        private static const NAME_STATE_WRITING:int = 1;
        private static const NAME_STATE_SAVED:int = 2;
        private static const NAME_TEXT_COLOR_SAVED:uint = 0;
        private static const NAME_TEXT_COLOR_WRITING:uint = 8956552;
        private static const NAME_TEXT_COLOR_HINT:uint = 0x777777;
        private static const MANNEQUIN_CLOTHING_PART_TYPES:Array = new Array("ca", "cc", "ch", "lg", "sh", "wa");
        private static const MANNEQUIN_FIGURE:Array = ["hd", 99999, [99998]];
        private static const ICON_STYLE_CLUB:int = 13;
        private static const ICON_STYLE_VIP:int = 14;

        private var _window:_SafeStr_3133;
        private var _SafeStr_4318:int;
        private var _SafeStr_4317:String;
        private var _SafeStr_4315:String;
        private var _SafeStr_4316:int;
        private var _savedOutfitName:String;
        private var _SafeStr_4319:int = -1;

        public function MannequinWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            this.handler.widget = this;
        }

        public function get handler():MannequinWidgetHandler
        {
            return (_SafeStr_3914 as MannequinWidgetHandler);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            super.dispose();
        }

        public function open(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            _SafeStr_4318 = _arg_1;
            _SafeStr_4317 = _arg_2;
            _SafeStr_4315 = _arg_3;
            _savedOutfitName = _arg_4;
            var _local_10:IRoomSession = (_SafeStr_3914 as MannequinWidgetHandler).container.roomSession;
            var _local_6:ISessionDataManager = (_SafeStr_3914 as MannequinWidgetHandler).container.sessionDataManager;
            var _local_11:Boolean = (((_local_10.isRoomOwner) || (_local_10.roomControllerLevel >= 1)) || (_local_6.isAnyRoomController));
            var _local_8:_SafeStr_1701 = (_SafeStr_3914 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_9:_SafeStr_3164 = _local_8.createFigureContainer(_arg_2);
            _SafeStr_4316 = _local_8.resolveClubLevel(_local_9, _SafeStr_4315, MANNEQUIN_CLOTHING_PART_TYPES);
            var _local_7:int = resolveFirstWindowContent(_local_11, _local_6.gender, _local_6.clubLevel, _arg_3, _SafeStr_4316);
            setWindowContent(_local_7);
            var _local_5:int = (((_savedOutfitName) && (!(_savedOutfitName == ""))) ? 2 : 0);
            setOutfitNameState(_local_5);
            _window.visible = true;
        }

        private function resolveFirstWindowContent(_arg_1:Boolean, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:int):int
        {
            if (_arg_1)
            {
                return (0);
            };
            if (_arg_2.toLowerCase() != _arg_4.toLowerCase())
            {
                return (4);
            };
            if (_arg_3 < _arg_5)
            {
                return (3);
            };
            return (2);
        }

        private function setWindowContent(_arg_1:int):void
        {
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_3:ISessionDataManager = (_SafeStr_3914 as MannequinWidgetHandler).container.sessionDataManager;
            var _local_4:String = _local_3.figure;
            var _local_5:_SafeStr_1701 = (_SafeStr_3914 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_2:int = (((_savedOutfitName) && (!(_savedOutfitName == ""))) ? 2 : 0);
            if (!_window)
            {
                _window = (windowManager.buildFromXML((assets.getAssetByName("mannequin_widget_frame_xml").content as XML)) as _SafeStr_3133);
                addClickListener("header_button_close");
                _window.center();
            };
            (_window as _SafeStr_3263).content.removeChildAt(0);
            var _local_8:_SafeStr_3133 = createWindow(_arg_1);
            (_window as _SafeStr_3263).content.addChild(_local_8);
            switch (_arg_1)
            {
                case 0:
                    addClickListener("configure_button");
                    addClickListener("wear_button");
                    addTextFieldListener("outfit_name_set");
                    addClickListener("outfit_name_set");
                    _local_6 = _local_5.createFigureContainer(_SafeStr_4317);
                    transformAsMannequinFigure(_local_6);
                    _local_7 = createAvatarImage(_local_6.getFigureString());
                    updateClubLevelView(_SafeStr_4316);
                    setOutfitNameState(_local_2);
                    updateDecorations();
                    break;
                case 1:
                    addClickListener("save_button");
                    addClickListener("back_region");
                    _local_6 = _local_5.createFigureContainer(_local_4);
                    transformAsMannequinFigure(_local_6);
                    _local_7 = createAvatarImage(_local_6.getFigureString());
                    updateClubLevelView(_local_5.resolveClubLevel(_local_6, _local_3.gender, MANNEQUIN_CLOTHING_PART_TYPES));
                    setOutfitNameState(_local_2);
                    break;
                case 2:
                    addClickListener("wear_button");
                    _local_6 = applyMannequinOutfit(_local_4, _SafeStr_4317);
                    _local_7 = createAvatarImage(_local_6.getFigureString());
                    updateClubLevelView(_SafeStr_4316);
                    setOutfitNameState(_local_2);
                    break;
                case 3:
                    addClickListener("get_club_button");
                    _local_6 = applyMannequinOutfit(_local_4, _SafeStr_4317);
                    _local_7 = createAvatarImage(_local_6.getFigureString());
                    updateClubLevelView(_SafeStr_4316);
                    break;
                case 4:
                    addClickListener("ok_button");
                    _local_6 = _local_5.createFigureContainer(_SafeStr_4317);
                    transformAsMannequinFigure(_local_6);
                    _local_7 = createAvatarImage(_local_6.getFigureString());
                    updateClubLevelView(_SafeStr_4316);
                    break;
                default:
                    throw (new Error(("Invalid type for mannequin widget content apply: " + _arg_1)));
            };
            updatePreviewImage(_local_8, _local_7);
        }

        private function createWindow(_arg_1:int):_SafeStr_3133
        {
            var _local_3:* = null;
            var _local_2:* = null;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = _assets.getAssetByName("mannequin_controller_main_xml");
                    break;
                case 1:
                    _local_2 = _assets.getAssetByName("mannequin_controller_save_xml");
                    break;
                case 2:
                    _local_2 = _assets.getAssetByName("mannequin_peer_main_xml");
                    break;
                case 3:
                    _local_2 = _assets.getAssetByName("mannequin_no_club_xml");
                    break;
                case 4:
                    _local_2 = _assets.getAssetByName("mannequin_wrong_gender_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for mannequin widget content creation: " + _arg_1)));
            };
            return ((_SafeStr_3914 as MannequinWidgetHandler).container.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
        }

        private function transformAsMannequinFigure(_arg_1:_SafeStr_3164):void
        {
            for each (var _local_2:String in _arg_1.getPartTypeIds())
            {
                if (MANNEQUIN_CLOTHING_PART_TYPES.indexOf(_local_2) == -1)
                {
                    _arg_1.removePart(_local_2);
                };
            };
            _arg_1.updatePart(MANNEQUIN_FIGURE[0], MANNEQUIN_FIGURE[1], MANNEQUIN_FIGURE[2]);
        }

        private function createAvatarImage(_arg_1:String):BitmapData
        {
            var _local_3:_SafeStr_1701 = (_SafeStr_3914 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_4:_SafeStr_3138 = _local_3.createAvatarImage(_arg_1, "h");
            var _local_2:BitmapData = _local_4.getCroppedImage("full");
            _local_4.dispose();
            return (_local_2);
        }

        private function applyMannequinOutfit(_arg_1:String, _arg_2:String):_SafeStr_3164
        {
            var _local_5:* = null;
            var _local_4:_SafeStr_1701 = (_SafeStr_3914 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_3:_SafeStr_3164 = _local_4.createFigureContainer(_arg_1);
            var _local_6:_SafeStr_3164 = _local_4.createFigureContainer(_arg_2);
            for each (_local_5 in MANNEQUIN_CLOTHING_PART_TYPES)
            {
                _local_3.removePart(_local_5);
            };
            for each (_local_5 in _local_6.getPartTypeIds())
            {
                _local_3.updatePart(_local_5, _local_6.getPartSetId(_local_5), _local_6.getPartColorIds(_local_5));
            };
            return (_local_3);
        }

        private function updateClubLevelView(_arg_1:int):void
        {
            var _local_2:IIconWindow = (_window.findChildByName("club_icon") as IIconWindow);
            if (!_local_2)
            {
                return;
            };
            switch (_arg_1)
            {
                case 0:
                    _local_2.visible = false;
                    return;
                case 1:
                    _local_2.style = 13;
                    _local_2.visible = true;
                    return;
                case 2:
                    _local_2.style = 14;
                    _local_2.visible = true;
                default:
            };
        }

        private function updatePreviewImage(_arg_1:_SafeStr_3133, _arg_2:BitmapData):void
        {
            var _local_5:* = null;
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return;
            };
            var _local_6:_SafeStr_3264 = (_arg_1.findChildByName("preview_image") as _SafeStr_3264);
            if (_local_6.bitmap == null)
            {
                _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height);
            };
            var _local_3:IAsset = (assets.getAssetByName("mannequin_preview_bg_png") as IAsset);
            if (_local_3)
            {
                _local_5 = (_local_3.content as BitmapData);
                _local_6.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
            };
            var _local_4:Point = new Point(((_local_6.width - _arg_2.width) / 2), ((_local_6.height - _arg_2.height) / 2));
            _local_6.bitmap.copyPixels(_arg_2, _arg_2.rect, _local_4, null, null, true);
        }

        private function updateDecorations():void
        {
            var _local_1:* = null;
            var _local_2:_SafeStr_3264 = (_window.findChildByName("write_deco") as _SafeStr_3264);
            if (_local_2)
            {
                _local_1 = (_assets.getAssetByName("small_pen") as BitmapDataAsset);
                _local_2.bitmap = (_local_1.content as BitmapData);
                _local_2.disposesBitmap = false;
            };
        }

        private function close():void
        {
            _window.visible = false;
        }

        private function setOutfitNameState(_arg_1:int):void
        {
            _SafeStr_4319 = _arg_1;
            var _local_3:ITextWindow = (_window.findChildByName("outfit_name_set") as ITextWindow);
            if (_local_3)
            {
                switch (_arg_1)
                {
                    case 0:
                        _local_3.text = handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
                        _local_3.textColor = 0x777777;
                        _local_3.italic = true;
                        break;
                    case 1:
                        _local_3.textColor = 8956552;
                        _local_3.italic = false;
                        break;
                    case 2:
                        _local_3.text = _savedOutfitName;
                        _local_3.textColor = 0;
                        _local_3.italic = false;
                        break;
                    default:
                        _local_3.text = handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
                        _local_3.textColor = 0x777777;
                };
            };
            var _local_2:ITextWindow = (_window.findChildByName("outfit_name_show") as ITextWindow);
            if ((((_local_2) && (_savedOutfitName)) && (!(_savedOutfitName == ""))))
            {
                _local_2.text = (("'" + _savedOutfitName) + "'");
            };
        }

        private function clearNameField():void
        {
            var _local_1:ITextWindow = (_window.findChildByName("outfit_name_set") as ITextWindow);
            if (_local_1)
            {
                _local_1.text = "";
            };
        }

        private function saveOutfit():void
        {
            handler.container.connection.send(new _SafeStr_772(_SafeStr_4318));
        }

        private function saveOutfitName():void
        {
            var _local_1:String = getNameFromView();
            handler.container.connection.send(new _SafeStr_907(_SafeStr_4318, _local_1));
            _savedOutfitName = _local_1;
            setOutfitNameState(2);
        }

        private function getNameFromView():String
        {
            var _local_2:String = (_window.findChildByName("outfit_name_set") as ITextWindow).text;
            var _local_1:String = handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
            return ((_local_2 == _local_1) ? "" : _local_2);
        }

        private function addClickListener(_arg_1:String):void
        {
            _window.findChildByName(_arg_1).addEventListener("WME_CLICK", onMouseClick);
        }

        private function addTextFieldListener(_arg_1:String):void
        {
            _window.findChildByName(_arg_1).addEventListener("WKE_KEY_UP", onKeyTyped);
        }

        private function onKeyTyped(_arg_1:WindowKeyboardEvent):void
        {
            if (_arg_1.keyCode == 13)
            {
                saveOutfitName();
            }
            else
            {
                if (_SafeStr_4319 != 1)
                {
                    setOutfitNameState(1);
                };
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:ISessionDataManager = (_SafeStr_3914 as MannequinWidgetHandler).container.sessionDataManager;
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_text":
                case "ok_button":
                    close();
                    return;
                case "save_button":
                    saveOutfit();
                    close();
                    return;
                case "wear_button":
                    if (_local_2.clubLevel < _SafeStr_4316)
                    {
                        setWindowContent(3);
                    }
                    else
                    {
                        if (_local_2.gender.toLowerCase() != _SafeStr_4315.toLowerCase())
                        {
                            setWindowContent(4);
                        }
                        else
                        {
                            handler.container.connection.send(new _SafeStr_558(_SafeStr_4318));
                            close();
                        };
                    };
                    return;
                case "configure_button":
                    saveOutfitName();
                    setWindowContent(1);
                    return;
                case "back_region":
                    setWindowContent(0);
                    return;
                case "get_club_button":
                    (_SafeStr_3914 as MannequinWidgetHandler).container.catalog.openClubCenter();
                    close();
                    return;
                case "outfit_name_set":
                    if (_SafeStr_4319 == 0)
                    {
                        clearNameField();
                        setOutfitNameState(1);
                    }
                    else
                    {
                        if (_SafeStr_4319 == 2)
                        {
                            setOutfitNameState(1);
                        };
                    };
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.mannequin

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4315 = "_-Q1F" (String#14306, DoABC#4)
// _SafeStr_4316 = "_-c1h" (String#8115, DoABC#4)
// _SafeStr_4317 = "_-41K" (String#10504, DoABC#4)
// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_4319 = "_-ei" (String#13741, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_772 = "_-J1p" (String#30743, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8961 = "_-P1x" (String#12057, DoABC#4)
// _SafeStr_9020 = "_-k2" (String#32405, DoABC#4)
// _SafeStr_9021 = "_-M1y" (String#38617, DoABC#4)
// _SafeStr_9022 = "_-U1n" (String#36413, DoABC#4)
// _SafeStr_9023 = "_-yr" (String#34597, DoABC#4)
// _SafeStr_9024 = "_-91i" (String#33048, DoABC#4)
// _SafeStr_907 = "_-61Q" (String#31122, DoABC#4)


