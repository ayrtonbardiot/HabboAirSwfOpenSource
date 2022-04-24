// by nota

//com.sulake.habbo.ui.widget.chatinput.RoomChatInputView

package com.sulake.habbo.ui.widget.chatinput
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3290;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.text.TextFormat;
    import flash.utils.Timer;
    import com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.geom.Rectangle;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import flash.events.KeyboardEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import com.sulake.habbo.session.ISessionDataManager;

    public class RoomChatInputView 
    {

        private static const MARGIN_H:int = 12;
        private static const CHAT_HELP_INTERNAL_CLIENT_LINK:String = "habbopages/chat/commands";

        private var _SafeStr_4981:RoomChatInputWidget;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6000:ITextFieldWindow;
        private var _SafeStr_8966:_SafeStr_3109;
        private var _SafeStr_6265:_SafeStr_3109;
        private var _helpButton:_SafeStr_3290;
        private var _helpButtonShowRegion:IRegionWindow;
        private var _mouseOverHelpButton:Boolean = false;
        private var _SafeStr_6260:_SafeStr_3133;
        private var _SafeStr_6271:_SafeStr_3133;
        private var _chatModeIdShout:String;
        private var _SafeStr_6266:String;
        private var _SafeStr_6269:String;
        private var _SafeStr_6264:Boolean = false;
        private var _SafeStr_6262:TextFormat;
        private var _SafeStr_5030:Boolean = false;
        private var _SafeStr_6270:Boolean = false;
        private var _SafeStr_6243:Timer;
        private var _SafeStr_6257:Timer;
        private var _SafeStr_6259:Timer;
        private var _SafeStr_6267:String = "";
        private var _SafeStr_3920:Timer;
        private var _SafeStr_6258:Boolean = false;
        private var _SafeStr_6261:Timer;
        private var _SafeStr_6268:int = 0;
        private var _SafeStr_6272:Timer;
        private var _SafeStr_6263:ChatStyleSelector;

        public function RoomChatInputView(_arg_1:RoomChatInputWidget)
        {
            var _local_3:* = null;
            var _local_2:int;
            super();
            _SafeStr_4981 = _arg_1;
            _SafeStr_6266 = _arg_1.localizations.getLocalization("widgets.chatinput.mode.whisper", ":tell");
            _chatModeIdShout = _arg_1.localizations.getLocalization("widgets.chatinput.mode.shout", ":shout");
            _SafeStr_6269 = _arg_1.localizations.getLocalization("widgets.chatinput.mode.speak", ":speak");
            _SafeStr_6243 = new Timer(1000, 1);
            _SafeStr_6243.addEventListener("timerComplete", onTypingTimerComplete);
            _SafeStr_6257 = new Timer(10000, 1);
            _SafeStr_6257.addEventListener("timerComplete", onIdleTimerComplete);
            _SafeStr_6258 = ((sessionDataManager.isNoob) || (sessionDataManager.isRealNoob));
            if (_SafeStr_6258)
            {
                _local_3 = _arg_1.handler.container.config;
                if (_local_3.getProperty("nux.chat.reminder.shown") != "1")
                {
                    _local_2 = _local_3.getInteger("nux.noob.chat.reminder.delay", 240);
                    _SafeStr_6259 = new Timer((_local_2 * 1000), 1);
                    _SafeStr_6259.addEventListener("timerComplete", onNuxIdleTimerComplete);
                    _SafeStr_6259.start();
                };
            };
            _SafeStr_6262 = new TextFormat(null, null, 0x999999, null, true, false);
            createWindow();
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function dispose():void
        {
            if (_SafeStr_6258)
            {
                widget.windowManager.hideHint();
                widget.windowManager.unregisterHintWindow("nux_chat_reminder");
            };
            _SafeStr_4981 = null;
            if (_SafeStr_6000)
            {
                _SafeStr_6000.removeEventListener("WME_DOWN", windowMouseEventProcessor);
                _SafeStr_6000.removeEventListener("WKE_KEY_DOWN", windowKeyEventProcessor);
                _SafeStr_6000.removeEventListener("WKE_KEY_UP", keyUpHandler);
                _SafeStr_6000.removeEventListener("WE_CHANGE", onInputChanged);
                _SafeStr_6000.removeEventListener("WME_OVER", onInputHoverRegionMouseEvent);
                _SafeStr_6000.removeEventListener("WME_OUT", onInputHoverRegionMouseEvent);
                _SafeStr_6000 = null;
            };
            _SafeStr_8966 = null;
            _SafeStr_6265 = null;
            if (_helpButton)
            {
                _helpButton.removeEventListener("WME_CLICK", onHelpButtonMouseEvent);
                _helpButton.removeEventListener("WME_OVER", onHelpButtonMouseEvent);
                _helpButton.removeEventListener("WME_OUT", onHelpButtonMouseEvent);
                _helpButton = null;
            };
            if (_helpButtonShowRegion)
            {
                _helpButtonShowRegion.removeEventListener("WME_OVER", onInputHoverRegionMouseEvent);
                _helpButtonShowRegion.removeEventListener("WME_OUT", onInputHoverRegionMouseEvent);
                _helpButtonShowRegion = null;
            };
            if (_SafeStr_6260 != null)
            {
                _SafeStr_6260.dispose();
                _SafeStr_6260 = null;
            };
            if (_SafeStr_6243 != null)
            {
                _SafeStr_6243.reset();
                _SafeStr_6243.removeEventListener("timerComplete", onTypingTimerComplete);
                _SafeStr_6243 = null;
            };
            if (_SafeStr_6257 != null)
            {
                _SafeStr_6257.reset();
                _SafeStr_6257.removeEventListener("timerComplete", onIdleTimerComplete);
                _SafeStr_6257 = null;
            };
            if (_SafeStr_6259 != null)
            {
                _SafeStr_6259.reset();
                _SafeStr_6259.removeEventListener("timerComplete", onNuxIdleTimerComplete);
                _SafeStr_6259 = null;
            };
            if (_SafeStr_6261 != null)
            {
                _SafeStr_6261.reset();
                _SafeStr_6261.removeEventListener("timerComplete", onChatReminderTimer);
                _SafeStr_6261 = null;
            };
            if (_SafeStr_3920)
            {
                _SafeStr_3920.reset();
                _SafeStr_3920.removeEventListener("timerComplete", onRemoveDimmer);
                _SafeStr_3920 = null;
            };
            if (((_window) && (_window.desktop)))
            {
                _window.desktop.removeChild(_window);
            };
        }

        private function createWindow():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_3:Boolean;
            var _local_7:* = null;
            if (_SafeStr_6260 != null)
            {
                return;
            };
            var _local_6:String = "chatinput_window_new";
            var _local_5:XmlAsset = (_SafeStr_4981.assets.getAssetByName(_local_6) as XmlAsset);
            if (((_local_5 == null) || (_local_5.content == null)))
            {
                return;
            };
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_5.content as XML)) as _SafeStr_3133);
            _window.width = _window.desktop.width;
            _window.height = _window.desktop.height;
            _window.invalidate();
            _SafeStr_6271 = _SafeStr_3133(_window.findChildByName("chatstyles_menu"));
            _SafeStr_6260 = (_window.findChildByName("bubblecont") as _SafeStr_3133);
            _SafeStr_6260.tags.push("room_widget_chatinput");
            _SafeStr_6000 = (_SafeStr_6260.findChildByName("chat_input") as ITextFieldWindow);
            _SafeStr_8966 = _SafeStr_6260.findChildByName("input_border");
            _SafeStr_6265 = _SafeStr_6260.findChildByName("block_text");
            _helpButtonShowRegion = IRegionWindow(_SafeStr_6260.findChildByName("helpbutton_show_hover_region"));
            _helpButtonShowRegion.addEventListener("WME_OVER", onInputHoverRegionMouseEvent);
            _helpButtonShowRegion.addEventListener("WME_OUT", onInputHoverRegionMouseEvent);
            updatePosition();
            _SafeStr_6000.setParamFlag(1, true);
            _SafeStr_6000.addEventListener("WME_DOWN", windowMouseEventProcessor);
            _SafeStr_6000.addEventListener("WKE_KEY_DOWN", windowKeyEventProcessor);
            _SafeStr_6000.addEventListener("WKE_KEY_UP", keyUpHandler);
            _SafeStr_6000.addEventListener("WE_CHANGE", onInputChanged);
            _SafeStr_6000.addEventListener("WME_OVER", onInputHoverRegionMouseEvent);
            _SafeStr_6000.addEventListener("WME_OUT", onInputHoverRegionMouseEvent);
            _SafeStr_6000.toolTipDelay = 0;
            _SafeStr_6000.toolTipIsDynamic = true;
            _SafeStr_6264 = true;
            _SafeStr_6000.setTextFormat(_SafeStr_6262);
            _SafeStr_6267 = "";
            _window.addEventListener("WE_PARENT_RESIZED", updatePosition);
            _window.addEventListener("WE_PARENT_ADDED", updatePosition);
            if (((((customChatStylesEnabled()) && (!(_SafeStr_4981.handler.container.roomSession.isGameSession))) && (!(_SafeStr_4981.handler.container.freeFlowChat == null))) && (!(_SafeStr_4981.handler.container.freeFlowChat.chatStyleLibrary == null))))
            {
                _local_1 = [];
                _local_2 = _SafeStr_4981.roomUi.getProperty("disabled.custom.chat.styles").split(",");
                _local_3 = _SafeStr_4981.handler.container.sessionDataManager.hasSecurity(4);
                for each (var _local_4:int in _SafeStr_4981.handler.container.freeFlowChat.chatStyleLibrary.getStyleIds())
                {
                    _local_7 = _SafeStr_4981.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_local_4);
                    if (((!(_local_7.isSystemStyle)) && (_local_2.indexOf(_local_4.toString()) == -1)))
                    {
                        if (((_local_7.isHcOnly) && (_SafeStr_4981.handler.container.sessionDataManager.hasClub)))
                        {
                            _local_1.push(_local_4);
                        }
                        else
                        {
                            if (((!(_local_7.isHcOnly)) && (!(_local_7.isAmbassadorOnly))))
                            {
                                _local_1.push(_local_4);
                            };
                        };
                    };
                    if (((_local_7.isStaffOverrideable) && (_local_3)))
                    {
                        _local_1.push(_local_4);
                    };
                    if (((_local_7.isAmbassadorOnly) && ((_local_3) || (_SafeStr_4981.handler.container.sessionDataManager.isAmbassador))))
                    {
                        _local_1.push(_local_4);
                    };
                };
                removeDuplicateStyles(_local_1);
                createChatStyleSelectorMenuItems(_local_1);
            }
            else
            {
                if ((_SafeStr_6260.findChildByName("chat_input_container") is IItemListWindow))
                {
                    IItemListWindow(_SafeStr_6260.findChildByName("chat_input_container")).removeListItemAt(0);
                };
            };
            createAndAttachDimmerWindow();
            _helpButton = _SafeStr_3290(_window.findChildByName("helpbutton"));
            _helpButton.addEventListener("WME_CLICK", onHelpButtonMouseEvent);
            _helpButton.addEventListener("WME_OVER", onHelpButtonMouseEvent);
            _helpButton.addEventListener("WME_OUT", onHelpButtonMouseEvent);
            _helpButton.visible = false;
        }

        private function removeDuplicateStyles(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < (_arg_1.length - 1))
            {
                _local_3 = (_local_2 + 1);
                while (_local_3 < _arg_1.length)
                {
                    if (_arg_1[_local_2] === _arg_1[_local_3])
                    {
                        _arg_1.splice(_local_3--, 1);
                    };
                    _local_3++;
                };
                _local_2++;
            };
        }

        private function customChatStylesEnabled():Boolean
        {
            return (_SafeStr_4981.roomUi.getBoolean("custom.chat.styles.enabled"));
        }

        private function createAndAttachDimmerWindow():void
        {
            var _local_1:* = null;
            if (RoomEnterEffect.isRunning())
            {
                _local_1 = _SafeStr_4981.windowManager.createWindow("chat_dimmer", "", 30, 1, ((0x80 | 0x0800) | 0x01), new Rectangle(0, 0, _SafeStr_6260.width, _SafeStr_6260.height), null, 0);
                _local_1.color = 0;
                _local_1.blend = 0.3;
                _SafeStr_6260.addChild(_local_1);
                _SafeStr_6260.invalidate();
                if (_SafeStr_3920 == null)
                {
                    _SafeStr_3920 = new Timer(RoomEnterEffect.totalRunningTime, 1);
                    _SafeStr_3920.addEventListener("timerComplete", onRemoveDimmer);
                    _SafeStr_3920.start();
                };
            };
        }

        private function onRemoveDimmer(_arg_1:TimerEvent):void
        {
            _SafeStr_3920.removeEventListener("timerComplete", onRemoveDimmer);
            _SafeStr_3920 = null;
            var _local_2:_SafeStr_3109 = _SafeStr_6260.findChildByName("chat_dimmer");
            if (_local_2 != null)
            {
                _SafeStr_6260.removeChild(_local_2);
                _SafeStr_4981.windowManager.destroy(_local_2);
            };
        }

        public function updatePosition(_arg_1:_SafeStr_3116=null, _arg_2:int=10000, _arg_3:int=10000):void
        {
            _window.width = _window.desktop.width;
            _window.height = _window.desktop.height;
            var _local_9:Point = new Point();
            if (!_SafeStr_6260)
            {
                return;
            };
            var _local_4:int = widget.getToolBarWidth();
            var _local_6:int = widget.getFriendBarWidth();
            var _local_5:int = int(((_window.desktop.width / 2) - (_SafeStr_6260.width / 2)));
            var _local_7:int;
            var _local_8:int = (_SafeStr_6260.width + 12);
            if (((_window.desktop.width - _local_4) - _local_6) > _local_8)
            {
                _local_7 = (_local_4 + 12);
                _SafeStr_6260.y = (_window.desktop.height - 104);
                if ((_local_5 + _SafeStr_6260.width) > (_window.desktop.width - _local_6))
                {
                    _local_5 = 0;
                };
            }
            else
            {
                _local_7 = (widget.getRoomToolsWidth() + 12);
                _SafeStr_6260.y = (_window.desktop.height - 160);
            };
            _SafeStr_6260.x = Math.max(_local_5, _local_7);
            if (_SafeStr_6263)
            {
                _SafeStr_6263.alignMenuToSelector();
            };
        }

        private function onSend(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_6264)
            {
                sendChatFromInputField();
            };
        }

        public function hideFloodBlocking():void
        {
            _SafeStr_6000.visible = true;
            _SafeStr_6265.visible = false;
        }

        public function showFloodBlocking():void
        {
            _SafeStr_6000.visible = false;
            _SafeStr_6265.visible = true;
        }

        public function updateBlockText(_arg_1:int):void
        {
            _SafeStr_6265.caption = _SafeStr_4981.localizations.registerParameter("chat.input.alert.flood", "time", _arg_1.toString());
        }

        public function displaySpecialChatMessage(_arg_1:String, _arg_2:String=""):void
        {
            if (((_SafeStr_6260 == null) || (_SafeStr_6000 == null)))
            {
                return;
            };
            _SafeStr_6000.enable();
            _SafeStr_6000.selectable = true;
            _SafeStr_6000.text = "";
            setInputFieldFocus();
            _SafeStr_6000.text = (_SafeStr_6000.text + (_arg_1 + " "));
            if (_arg_2.length > 0)
            {
                _SafeStr_6000.text = (_SafeStr_6000.text + (_arg_2 + " "));
            };
            _SafeStr_6000.setSelection(_SafeStr_6000.text.length, _SafeStr_6000.text.length);
            _SafeStr_6267 = _SafeStr_6000.text;
        }

        private function windowMouseEventProcessor(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            setInputFieldFocus();
        }

        private function windowKeyEventProcessor(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            var _local_7:uint;
            var _local_3:Boolean;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_5:* = null;
            if ((((_SafeStr_6260 == null) || (_SafeStr_4981 == null)) || (_SafeStr_4981.floodBlocked)))
            {
                return;
            };
            if (anotherFieldHasFocus())
            {
                return;
            };
            setInputFieldFocus();
            if ((_arg_1 is WindowKeyboardEvent))
            {
                _local_6 = (_arg_1 as WindowKeyboardEvent);
                _local_7 = _local_6.charCode;
                _local_3 = _local_6.shiftKey;
            };
            if ((_arg_1 is KeyboardEvent))
            {
                _local_4 = (_arg_1 as KeyboardEvent);
                _local_7 = _local_4.charCode;
                _local_3 = _local_4.shiftKey;
            };
            if (((_local_4 == null) && (_local_6 == null)))
            {
                return;
            };
            if (_local_7 == 32)
            {
                checkSpecialKeywordForInput();
            };
            if (_local_7 == 13)
            {
                sendChatFromInputField(_local_3);
                setButtonPressedState(true);
            };
            if (_local_7 == 8)
            {
                if (_SafeStr_6000 != null)
                {
                    _local_8 = _SafeStr_6000.text;
                    _local_5 = _local_8.split(" ");
                    if ((((_local_5[0] == _SafeStr_6266) && (_local_5.length == 3)) && (_local_5[2] == "")))
                    {
                        _SafeStr_6000.text = "";
                        _SafeStr_6267 = "";
                    };
                };
            };
        }

        private function keyUpHandler(_arg_1:WindowKeyboardEvent):void
        {
            if (_arg_1.keyCode == 13)
            {
                setButtonPressedState(false);
            };
        }

        private function setButtonPressedState(_arg_1:Boolean):void
        {
        }

        private function onInputChanged(_arg_1:_SafeStr_3116):void
        {
            var _local_2:ITextFieldWindow = (_arg_1.window as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_6257.reset();
            var _local_3:* = (_local_2.text.length == 0);
            if (_local_3)
            {
                _SafeStr_5030 = false;
                _SafeStr_6243.start();
            }
            else
            {
                if (_local_2.text.length > (_SafeStr_6267.length + 1))
                {
                    if (_SafeStr_4981.allowPaste)
                    {
                        _SafeStr_4981.setLastPasteTime();
                    }
                    else
                    {
                        _local_2.text = "";
                    };
                };
                _SafeStr_6267 = _local_2.text;
                if (!_SafeStr_5030)
                {
                    _SafeStr_5030 = true;
                    _SafeStr_6243.reset();
                    _SafeStr_6243.start();
                };
                _SafeStr_6257.start();
                if (_SafeStr_6259 != null)
                {
                    _SafeStr_6259.reset();
                    _SafeStr_6259 = null;
                };
            };
        }

        private function checkSpecialKeywordForInput():void
        {
            if (((_SafeStr_6000 == null) || (_SafeStr_6000.text == "")))
            {
                return;
            };
            var _local_2:String = _SafeStr_6000.text;
            var _local_1:String = _SafeStr_4981.selectedUserName;
            if (_local_2 == _SafeStr_6266)
            {
                if (_local_1.length > 0)
                {
                    _SafeStr_6000.text = (_SafeStr_6000.text + (" " + _SafeStr_4981.selectedUserName));
                    _SafeStr_6000.setSelection(_SafeStr_6000.text.length, _SafeStr_6000.text.length);
                    _SafeStr_6267 = _SafeStr_6000.text;
                };
            };
        }

        private function onIdleTimerComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5030)
            {
                _SafeStr_6270 = false;
            };
            _SafeStr_5030 = false;
            sendTypingMessage();
        }

        private function onNuxIdleTimerComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_6259 != null)
            {
                _SafeStr_6259.reset();
                _SafeStr_6259.removeEventListener("timerComplete", onNuxIdleTimerComplete);
                _SafeStr_6259 = null;
            };
            highlightChatInput();
        }

        private function onTypingTimerComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5030)
            {
                _SafeStr_6270 = true;
            };
            sendTypingMessage();
        }

        private function sendTypingMessage():void
        {
            if (_SafeStr_4981 == null)
            {
                return;
            };
            if (_SafeStr_4981.floodBlocked)
            {
                return;
            };
            var _local_1:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(_SafeStr_5030);
            _SafeStr_4981.messageListener.processWidgetMessage(_local_1);
        }

        private function highlightChatInput():void
        {
            _SafeStr_6000.text = widget.localizations.getLocalization("widgets.chatinput.mode.remind.noobie");
            _SafeStr_6261 = new Timer(500);
            _SafeStr_6261.addEventListener("timer", onChatReminderTimer);
            _SafeStr_6261.start();
            widget.windowManager.registerHintWindow("nux_chat_reminder", _SafeStr_6000);
            widget.windowManager.showHint("nux_chat_reminder");
        }

        private function onChatReminderTimer(_arg_1:TimerEvent):void
        {
            _SafeStr_6268++;
            if ((_SafeStr_6268 % 2) != 0)
            {
                _SafeStr_4981.mainWindow.y = (_SafeStr_4981.mainWindow.y - 1);
            }
            else
            {
                _SafeStr_4981.mainWindow.y = (_SafeStr_4981.mainWindow.y + 1);
            };
            if (_SafeStr_6268 >= 10)
            {
                _SafeStr_6261.reset();
                _SafeStr_6261 = null;
                _SafeStr_4981.mainWindow.y = 0;
                chatBarReminderShown();
            };
        }

        private function chatBarReminderShown():void
        {
            widget.handler.container.config.setProperty("nux.chat.reminder.shown", "1");
            if (_SafeStr_6261 != null)
            {
                _SafeStr_6261.reset();
            };
            widget.windowManager.hideHint();
            widget.windowManager.unregisterHintWindow("nux_chat_reminder");
        }

        private function setInputFieldFocus():void
        {
            if (_SafeStr_6000 == null)
            {
                return;
            };
            if (_SafeStr_6261 != null)
            {
                chatBarReminderShown();
            };
            if (_SafeStr_6264)
            {
                _SafeStr_6000.text = "";
                _SafeStr_6000.textColor = 0;
                _SafeStr_6000.italic = false;
                _SafeStr_6264 = false;
                _SafeStr_6267 = "";
            };
            _SafeStr_6000.focus();
        }

        public function setInputFieldColor(_arg_1:uint):void
        {
            if (_SafeStr_6000 == null)
            {
                return;
            };
            _SafeStr_6000.textColor = _arg_1;
            _SafeStr_6000.defaultTextFormat.color = _arg_1;
        }

        private function sendChatFromInputField(_arg_1:Boolean=false):void
        {
            if (((_SafeStr_6000 == null) || (_SafeStr_6000.text == "")))
            {
                return;
            };
            var _local_7:int = ((_arg_1) ? 2 : 0);
            var _local_6:String = _SafeStr_6000.text;
            var _local_4:Array = _local_6.split(" ");
            var _local_2:String = "";
            var _local_5:String = "";
            switch (_local_4[0])
            {
                case _SafeStr_6266:
                    _local_7 = 1;
                    _local_2 = _local_4[1];
                    _local_5 = (((_SafeStr_6266 + " ") + _local_2) + " ");
                    _local_4.shift();
                    _local_4.shift();
                    break;
                case _chatModeIdShout:
                    _local_7 = 2;
                    _local_4.shift();
                    break;
                case _SafeStr_6269:
                    _local_7 = 0;
                    _local_4.shift();
            };
            _local_6 = _local_4.join(" ");
            var _local_3:int;
            if (((customChatStylesEnabled()) && (!(_SafeStr_6263 == null))))
            {
                _local_3 = _SafeStr_6263.selectedStyleId;
            };
            if (_SafeStr_4981 != null)
            {
                if (_SafeStr_6243.running)
                {
                    _SafeStr_6243.reset();
                };
                if (_SafeStr_6257.running)
                {
                    _SafeStr_6257.reset();
                };
                _SafeStr_4981.sendChat(_local_6, _local_7, _local_2, _local_3);
                _SafeStr_5030 = false;
                if (_SafeStr_6270)
                {
                    sendTypingMessage();
                };
                _SafeStr_6270 = false;
            };
            if (_SafeStr_6000 != null)
            {
                _SafeStr_6000.text = _local_5;
            };
            _SafeStr_6267 = _local_5;
        }

        private function anotherFieldHasFocus():Boolean
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_SafeStr_6000 != null)
            {
                if (_SafeStr_6000.focused)
                {
                    return (false);
                };
            };
            var _local_1:DisplayObject = _SafeStr_6260.context.getDesktopWindow().getDisplayObject();
            if (_local_1 != null)
            {
                _local_3 = _local_1.stage;
                if (_local_3 != null)
                {
                    _local_2 = _local_3.focus;
                    if (_local_2 == null)
                    {
                        return (false);
                    };
                    if ((_local_2 is TextField))
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_SafeStr_4981.handler.container.sessionDataManager);
        }

        private function createChatStyleSelectorMenuItems(_arg_1:Array):void
        {
            var _local_3:int;
            var _local_2:int;
            if (!_SafeStr_6263)
            {
                _SafeStr_6263 = new ChatStyleSelector(this, _SafeStr_3133(_SafeStr_6260.findChildByName("styles")), sessionDataManager);
                _SafeStr_6263.gridColumns = ((_arg_1.length / 6) + 1);
            };
            _local_3 = (_arg_1.length - 1);
            while (_local_3 >= 0)
            {
                _local_2 = _arg_1[_local_3];
                _SafeStr_6263.addItem(_local_2, _SafeStr_4981.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_local_2).selectorPreview);
                _local_3--;
            };
            _SafeStr_6263.initSelection();
        }

        public function get widget():RoomChatInputWidget
        {
            return (_SafeStr_4981);
        }

        public function get chatStyleMenuContainer():_SafeStr_3133
        {
            return (_SafeStr_6271);
        }

        public function getChatInputY():int
        {
            if (((!(_window)) || (!(_window.findChildByName("chat_input_container")))))
            {
                return (0);
            };
            var _local_1:Point = new Point();
            _window.findChildByName("chat_input_container").getGlobalPosition(_local_1);
            return (_local_1.y);
        }

        public function getChatWindowElements():Array
        {
            return ([_SafeStr_6260, _SafeStr_6000]);
        }

        private function onHelpButtonMouseEvent(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4981.roomUi.context.createLinkEvent("habbopages/chat/commands");
            };
            if (_arg_1.type == "WME_OVER")
            {
                _helpButton.visible = true;
                _mouseOverHelpButton = true;
                stopHelpButtonHideTimer();
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    _mouseOverHelpButton = false;
                    startHelpButtonHideTimer();
                };
            };
        }

        private function onInputHoverRegionMouseEvent(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.type == "WME_OVER")
            {
                _helpButton.visible = true;
                stopHelpButtonHideTimer();
            }
            else
            {
                if (((_arg_1.type == "WME_OUT") && (!(_mouseOverHelpButton))))
                {
                    startHelpButtonHideTimer();
                };
            };
        }

        private function startHelpButtonHideTimer():void
        {
            if (_SafeStr_6272 != null)
            {
                stopHelpButtonHideTimer();
            };
            _SafeStr_6272 = new Timer(400);
            _SafeStr_6272.addEventListener("timer", onHelpButtonHideTimer);
            _SafeStr_6272.start();
        }

        private function onHelpButtonHideTimer(_arg_1:TimerEvent):void
        {
            if (((!(_mouseOverHelpButton)) && (_helpButton)))
            {
                _helpButton.visible = false;
            };
            stopHelpButtonHideTimer();
        }

        private function stopHelpButtonHideTimer():void
        {
            if (!_SafeStr_6272)
            {
                return;
            };
            _SafeStr_6272.stop();
            _SafeStr_6272.removeEventListener("timer", onHelpButtonHideTimer);
            _SafeStr_6272 = null;
        }


    }
}//package com.sulake.habbo.ui.widget.chatinput

// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3290 = "_-O1T" (String#11586, DoABC#4)
// _SafeStr_3366 = "_-ls" (String#8795, DoABC#4)
// _SafeStr_3920 = "_-V4" (String#2294, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5030 = "_-KT" (String#3697, DoABC#4)
// _SafeStr_6000 = "_-R1l" (String#822, DoABC#4)
// _SafeStr_6243 = "_-L1l" (String#3417, DoABC#4)
// _SafeStr_6257 = "_-511" (String#5899, DoABC#4)
// _SafeStr_6258 = "_-qV" (String#14931, DoABC#4)
// _SafeStr_6259 = "_-QH" (String#4069, DoABC#4)
// _SafeStr_6260 = "_-02k" (String#2594, DoABC#4)
// _SafeStr_6261 = "_-I1A" (String#4620, DoABC#4)
// _SafeStr_6262 = "_-z1X" (String#19380, DoABC#4)
// _SafeStr_6263 = "_-z1z" (String#6968, DoABC#4)
// _SafeStr_6264 = "_-P1r" (String#11122, DoABC#4)
// _SafeStr_6265 = "_-bP" (String#10101, DoABC#4)
// _SafeStr_6266 = "_-YK" (String#11005, DoABC#4)
// _SafeStr_6267 = "_-e" (String#4830, DoABC#4)
// _SafeStr_6268 = "_-YT" (String#12495, DoABC#4)
// _SafeStr_6269 = "_-tV" (String#18459, DoABC#4)
// _SafeStr_6270 = "_-E16" (String#9128, DoABC#4)
// _SafeStr_6271 = "_-K1S" (String#22483, DoABC#4)
// _SafeStr_6272 = "_-zf" (String#7051, DoABC#4)
// _SafeStr_8966 = "_-by" (String#15471, DoABC#4)


