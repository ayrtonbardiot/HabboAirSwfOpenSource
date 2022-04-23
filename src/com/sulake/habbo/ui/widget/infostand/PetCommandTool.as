// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.infostand.PetCommandTool

package com.sulake.habbo.ui.widget.infostand
{
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PetCommandTool 
    {

        private static const DEFAULT_LOCATION:Point = new Point(100, 70);
        private static const STATUS_BAR_WIDTH:int = 162;
        private static const STATUS_BAR_HEIGHT:int = 16;
        private static const STATUS_BAR_HIGHLIGHT_HEIGHT:int = 4;
        private static const STATUS_BAR_BORDER_COLOR:uint = 0xDADADA;
        private static const STATUS_BAR_BG_COLOR:uint = 0x3A3A3A;
        private static const STATUS_BAR_SKILL_HIGHLIGHT_COLOR:uint = 10513106;
        private static const STATUS_BAR_SKILL_CONTENT_COLOR:uint = 8734654;
        private static const STATE_SKILL:String = "skill";
        private static const PET_TYPE_HORSE:int = 15;

        private const BUTTONS_DISABLED_MS:int = 1100;

        private var _SafeStr_4981:InfoStandWidget;
        private var _SafeStr_6523:_SafeStr_3263;
        private var _SafeStr_6524:_SafeStr_3109;
        private var _SafeStr_5506:_SafeStr_24;
        private var _SafeStr_5935:int;
        private var _currentPetName:String;
        private var _SafeStr_6522:Timer;

        public function PetCommandTool(_arg_1:InfoStandWidget)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_5506 = new _SafeStr_24();
            _SafeStr_6522 = new Timer(1100);
            _SafeStr_6522.addEventListener("timer", onButtonDisableTimeout);
        }

        public static function hideChildren(_arg_1:_SafeStr_3133):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.numChildren)
            {
                _arg_1.getChildAt(_local_2).visible = false;
                _local_2++;
            };
        }

        public static function getLowestPoint(_arg_1:_SafeStr_3133):int
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.numChildren)
            {
                _local_4 = _arg_1.getChildAt(_local_2);
                if (_local_4.visible)
                {
                    _local_3 = Math.max(_local_3, (_local_4.y + _local_4.height));
                };
                _local_2++;
            };
            return (_local_3);
        }

        private static function createPercentageBar(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:uint):BitmapData
        {
            _arg_2 = Math.max(_arg_2, 1);
            _arg_1 = Math.max(_arg_1, 0);
            if (_arg_1 > _arg_2)
            {
                _arg_1 = _arg_2;
            };
            var _local_10:Number = (_arg_1 / _arg_2);
            var _local_9:int = 1;
            var _local_7:BitmapData = new BitmapData(162, 16, false);
            _local_7.fillRect(new Rectangle(0, 0, _local_7.width, _local_7.height), 0xDADADA);
            var _local_8:Rectangle = new Rectangle(_local_9, _local_9, (_local_7.width - (_local_9 * 2)), (_local_7.height - (_local_9 * 2)));
            _local_7.fillRect(_local_8, 0x3A3A3A);
            var _local_6:Rectangle = new Rectangle(_local_9, (_local_9 + 4), (_local_7.width - (_local_9 * 2)), ((_local_7.height - (_local_9 * 2)) - 4));
            _local_6.width = (_local_10 * _local_6.width);
            _local_7.fillRect(_local_6, _arg_3);
            var _local_5:Rectangle = new Rectangle(_local_9, _local_9, (_local_7.width - (_local_9 * 2)), 4);
            _local_5.width = (_local_10 * _local_5.width);
            _local_7.fillRect(_local_5, _arg_4);
            return (_local_7);
        }


        public function dispose():void
        {
            if (_SafeStr_6522)
            {
                _SafeStr_6522.stop();
                _SafeStr_6522 = null;
            };
            if (_SafeStr_4981)
            {
                _SafeStr_4981 = null;
            };
            if (_SafeStr_6523)
            {
                _SafeStr_6523.dispose();
            };
            _SafeStr_6523 = null;
        }

        public function getPetId():int
        {
            return (_SafeStr_5935);
        }

        public function isVisible():Boolean
        {
            if (_SafeStr_6523 == null)
            {
                return (false);
            };
            return (_SafeStr_6523.visible);
        }

        public function showCommandToolForPet(_arg_1:int, _arg_2:String, _arg_3:BitmapData, _arg_4:int, _arg_5:int, _arg_6:Number, _arg_7:int, _arg_8:Array):void
        {
            if (_SafeStr_6523 == null)
            {
                return;
            };
            updateStateElement("skill", ((_arg_5 + _arg_6) * 100), (_arg_7 * 100), 8734654, 10513106, _arg_4);
            if (_SafeStr_5935 == _arg_1)
            {
                return;
            };
            _SafeStr_5935 = _arg_1;
            _currentPetName = _arg_2;
            var _local_10:ITextWindow = (_SafeStr_6523.findChildByName("pet_name") as ITextWindow);
            if (_local_10 != null)
            {
                _local_10.text = _arg_2;
            };
            updatePetImage(_arg_3);
            var _local_9:CommandConfiguration = (_SafeStr_5506.getValue(_arg_1) as CommandConfiguration);
            if (_local_9 == null)
            {
                disableAllButtons();
                requestEnabledCommands(_SafeStr_5935);
            }
            else
            {
                updateCommandButtonsViewState(_local_9);
            };
        }

        public function updatePetImage(_arg_1:BitmapData):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:_SafeStr_3264 = (_SafeStr_6523.findChildByName("avatar_image") as _SafeStr_3264);
            if (_local_3 != null)
            {
                if (_arg_1 != null)
                {
                    _local_2 = new BitmapData(_local_3.width, _local_3.height, true, 0);
                    _local_4 = new Point(0, 0);
                    _local_4.x = Math.round(((_local_3.width - _arg_1.width) / 2));
                    _local_4.y = Math.round(((_local_3.height - _arg_1.height) / 2));
                    _local_2.copyPixels(_arg_1, _arg_1.rect, _local_4);
                    _local_3.bitmap = _local_2;
                }
                else
                {
                    _local_3.bitmap = null;
                };
                _local_3.invalidate();
            };
        }

        private function onButtonDisableTimeout(_arg_1:TimerEvent):void
        {
            var _local_2:CommandConfiguration = (_SafeStr_5506.getValue(_SafeStr_5935) as CommandConfiguration);
            updateCommandButtonsViewState(_local_2);
            _SafeStr_6522.stop();
        }

        public function setEnabledCommands(_arg_1:int, _arg_2:CommandConfiguration):void
        {
            _SafeStr_5506.remove(_arg_1);
            _SafeStr_5506.add(_arg_1, _arg_2);
            if (_arg_1 != _SafeStr_5935)
            {
                return;
            };
            updateCommandButtonsViewState(_arg_2);
            _SafeStr_6522.stop();
        }

        public function showWindow(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (_SafeStr_6523 == null)
                {
                    createCommandWindow();
                };
                _SafeStr_6523.visible = true;
            }
            else
            {
                if (_SafeStr_6523 != null)
                {
                    _SafeStr_6523.visible = false;
                };
            };
            _SafeStr_6522.stop();
        }

        private function requestEnabledCommands(_arg_1:int):void
        {
            var _local_2:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage("RWPCM_REQUEST_PET_COMMANDS", _arg_1);
            _SafeStr_4981.messageListener.processWidgetMessage(_local_2);
        }

        private function createCommandWindow():void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_3:XmlAsset = (_SafeStr_4981.assets.getAssetByName("pet_commands") as XmlAsset);
            _SafeStr_6523 = (_SafeStr_4981.windowManager.buildFromXML((_local_3.content as XML)) as _SafeStr_3263);
            if (_SafeStr_6523 == null)
            {
                throw (new Error("Failed to construct command window from XML!"));
            };
            _SafeStr_6523.context.getDesktopWindow().addEventListener("WE_RESIZED", onWindowDesktopResized);
            _SafeStr_6524 = _SafeStr_3133(_SafeStr_6523.findChildByName("commands_container")).removeChildAt(0);
            var _local_1:_SafeStr_3109 = _SafeStr_6523.findChildByName("header_button_close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onCommandWindowClose);
            };
            var _local_5:_SafeStr_3109 = _SafeStr_6523.findChildByName("description_link");
            if (_local_5 != null)
            {
                _local_5.addEventListener("WME_CLICK", onCommandWindowDescriptionLink);
            };
            var _local_2:_SafeStr_3109 = _SafeStr_6523.findChildByName("avatar_image");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onCommandWindowAvatarImageClick);
            };
            var _local_6:_SafeStr_3264 = (_SafeStr_6523.findChildByName("status_skill_icon") as _SafeStr_3264);
            if (_local_6 != null)
            {
                _local_7 = (_SafeStr_4981.assets.getAssetByName("icon_pet_skill") as BitmapDataAsset);
                _local_4 = (_local_7.content as BitmapData);
                _local_6.bitmap = _local_4.clone();
            };
            _SafeStr_6523.position = DEFAULT_LOCATION;
        }

        private function updateCommandButtonsViewState(_arg_1:CommandConfiguration):void
        {
            var _local_7:int;
            var _local_3:* = null;
            var _local_10:int;
            if (_SafeStr_6523 == null)
            {
                return;
            };
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_SafeStr_6523.findChildByName("commands_container"));
            hideChildren(_local_6);
            var _local_8:Array = _arg_1.allCommandIds;
            var _local_12:int = 25;
            var _local_11:int;
            var _local_2:int = 86;
            var _local_9:int;
            _local_7 = 0;
            while (_local_7 < _local_8.length)
            {
                _local_3 = (_local_6.getChildAt(_local_7) as _SafeStr_3122);
                if (_local_3 == null)
                {
                    _local_3 = (_SafeStr_6524.clone() as _SafeStr_3122);
                    _local_3.addEventListener("WME_CLICK", onTrainButtonMouseClick);
                    _local_6.addChild(_local_3);
                };
                _local_3.visible = true;
                _local_10 = _local_8[_local_7];
                _local_3.id = _local_10;
                _local_3.caption = _SafeStr_4981.localizations.getLocalization(("pet.command." + _local_10));
                if (_arg_1.isEnabled(_local_10))
                {
                    _local_3.enable();
                }
                else
                {
                    _local_3.disable();
                };
                _local_3.y = _local_9;
                if ((_local_7 % 2) == 1)
                {
                    _local_9 = (_local_9 + _local_12);
                    _local_3.x = _local_2;
                }
                else
                {
                    _local_3.x = _local_11;
                };
                _local_7++;
            };
            var _local_4:Boolean = _SafeStr_4981.config.getBoolean("pet.enhancements.enabled");
            var _local_5:int = ((_local_4) ? 180 : 160);
            _local_6.height = getLowestPoint(_local_6);
            _SafeStr_6523.height = (_local_6.height + _local_5);
            _SafeStr_6522.stop();
        }

        private function disableAllButtons():void
        {
            var _local_3:int;
            var _local_1:* = null;
            if (_SafeStr_6523 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_SafeStr_6523.findChildByName("commands_container"));
            _local_3 = 0;
            while (_local_3 < _local_2.numChildren)
            {
                _local_1 = _SafeStr_3122(_local_2.getChildAt(_local_3));
                _local_1.disable();
                _local_3++;
            };
        }

        private function onCommandWindowClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_6523.visible = false;
        }

        private function onCommandWindowDescriptionLink(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.windowManager.openHelpPage("help/pets/training");
        }

        private function onCommandWindowAvatarImageClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage("RWUAM_REQUEST_PET_UPDATE", _SafeStr_5935));
        }

        private function onTrainButtonMouseClick(_arg_1:WindowMouseEvent):void
        {
            var _local_6:_SafeStr_3109 = _arg_1.target;
            var _local_5:int = _local_6.id;
            var _local_3:String = ("pet.command." + _local_5);
            var _local_2:String = _SafeStr_4981.localizations.getLocalization(_local_3);
            var _local_4:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage("RWPCM_PET_COMMAND", _SafeStr_5935, ((_currentPetName + " ") + _local_2));
            _SafeStr_4981.messageListener.processWidgetMessage(_local_4);
            disableAllButtons();
            _SafeStr_6522.start();
        }

        private function onWindowDesktopResized(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (((_SafeStr_6523) && (!(_SafeStr_6523.disposed))))
            {
                _local_2 = _arg_1.window;
                _local_3 = new Rectangle();
                _SafeStr_6523.getGlobalRectangle(_local_3);
                if (_local_3.x > _local_2.width)
                {
                    _SafeStr_6523.x = (_local_2.width - _SafeStr_6523.width);
                    _SafeStr_6523.getGlobalRectangle(_local_3);
                };
                if ((_local_3.x + _local_3.width) <= 0)
                {
                    _SafeStr_6523.x = 0;
                    _SafeStr_6523.getGlobalRectangle(_local_3);
                };
                if (_local_3.y > _local_2.height)
                {
                    _SafeStr_6523.y = 0;
                    _SafeStr_6523.getGlobalRectangle(_local_3);
                };
                if ((_local_3.y + _local_3.height) <= 0)
                {
                    _SafeStr_6523.y = 0;
                    _SafeStr_6523.getGlobalRectangle(_local_3);
                };
            };
        }

        private function updateStateElement(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:uint, _arg_5:uint, _arg_6:int):void
        {
            var _local_8:* = null;
            if (_SafeStr_6523 == null)
            {
                return;
            };
            var _local_7:_SafeStr_3133 = (_SafeStr_6523.findChildByName((("status_" + _arg_1) + "_container")) as _SafeStr_3133);
            if (_local_7 == null)
            {
                return;
            };
            _local_7.visible = ((_SafeStr_4981.config.getBoolean("pet.enhancements.enabled")) && (_arg_6 == 15));
            var _local_10:ITextWindow = (_local_7.findChildByName((("status_" + _arg_1) + "_value_text")) as ITextWindow);
            if (_local_10 != null)
            {
                _local_10.text = ((_arg_2 + "/") + _arg_3);
            };
            var _local_11:ITextWindow = (_local_7.findChildByName((("status_" + _arg_1) + "_text")) as ITextWindow);
            if (_local_11 != null)
            {
                _local_11.caption = (("${infostand.pet.text.skill.next." + _arg_6) + "}");
            };
            var _local_9:_SafeStr_3264 = (_local_7.findChildByName((("status_" + _arg_1) + "_bitmap")) as _SafeStr_3264);
            if (_local_9 != null)
            {
                _local_8 = createPercentageBar(_arg_2, _arg_3, _arg_4, _arg_5);
                if (_local_8 != null)
                {
                    _local_9.bitmap = _local_8;
                    _local_9.width = _local_8.width;
                    _local_9.height = _local_8.height;
                    _local_9.invalidate();
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5506 = "_-M1R" (String#4674, DoABC#4)
// _SafeStr_5935 = "_-OJ" (String#4057, DoABC#4)
// _SafeStr_6522 = "_-gA" (String#5549, DoABC#4)
// _SafeStr_6523 = "_-91s" (String#2058, DoABC#4)
// _SafeStr_6524 = "_-12x" (String#18366, DoABC#4)


