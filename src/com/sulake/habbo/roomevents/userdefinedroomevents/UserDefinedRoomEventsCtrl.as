// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl

package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.TriggerConfs;
    import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionTypes;
    import com.sulake.habbo.roomevents.userdefinedroomevents.conditions.ConditionTypes;
    import flash.utils.Dictionary;
    import _-l12._SafeStr_1554;
    import com.sulake.habbo.roomevents.userdefinedroomevents.help.UserDefinedRoomEventsHelp;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import _-l12._SafeStr_1592;
    import _-l12._SafeStr_1593;
    import _-l12._SafeStr_1555;
    import com.sulake.habbo.roomevents.Util;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs._SafeStr_3287;
    import flash.events.Event;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionType;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs._SafeStr_3286;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import _-t14._SafeStr_222;
    import _-t14._SafeStr_427;
    import _-t14._SafeStr_1017;
    import _-t14._SafeStr_565;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.core.window.events.*;

    public class UserDefinedRoomEventsCtrl 
    {

        public static var STUFF_SELECTION_OPTION_NONE:int = 0;
        public static var STUFF_SELECTION_OPTION_BY_ID:int = 1;
        public static var STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE:int = 2;
        public static var STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT:int = 3;

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _window:_SafeStr_3263;
        private var _configureContainer:_SafeStr_3133;
        private var _SafeStr_4561:TriggerConfs = new TriggerConfs();
        private var _SafeStr_4562:ActionTypes = new ActionTypes();
        private var _SafeStr_4563:ConditionTypes = new ConditionTypes();
        private var _SafeStr_4558:Dictionary = new Dictionary();
        private var _SafeStr_4560:_SafeStr_1554;
        private var _SafeStr_4559:RoomObjectHightLighter;
        private var _help:UserDefinedRoomEventsHelp;
        private var _SafeStr_4564:SliderWindowController;

        public function UserDefinedRoomEventsCtrl(_arg_1:HabboUserDefinedRoomEvents)
        {
            _roomEvents = _arg_1;
            _SafeStr_4559 = new RoomObjectHightLighter(_arg_1);
            _help = new UserDefinedRoomEventsHelp(_arg_1);
        }

        public function stuffSelected(_arg_1:int, _arg_2:String):void
        {
            if (((_window == null) || (!(_window.visible))))
            {
                return;
            };
            if (!isStuffSelectionMode())
            {
                return;
            };
            if (_SafeStr_4558[_arg_1])
            {
                delete _SafeStr_4558[_arg_1];
                _SafeStr_4559.hide(_arg_1);
            }
            else
            {
                if (this.getStuffIds().length < _SafeStr_4560.furniLimit)
                {
                    _SafeStr_4558[_arg_1] = _arg_2;
                    _SafeStr_4559.show(_arg_1);
                };
            };
            refresh();
        }

        private function isStuffSelectionMode():Boolean
        {
            var _local_1:_SafeStr_3285 = resolveType();
            return (!(_local_1.requiresFurni == STUFF_SELECTION_OPTION_NONE));
        }

        private function resolveType():_SafeStr_3285
        {
            return (resolveHolder().getElementByCode(_SafeStr_4560.code));
        }

        private function resolveHolder():_SafeStr_3326
        {
            if ((_SafeStr_4560 as _SafeStr_1592) != null)
            {
                return (_SafeStr_4561);
            };
            if ((_SafeStr_4560 as _SafeStr_1593) != null)
            {
                return (_SafeStr_4562);
            };
            if ((_SafeStr_4560 as _SafeStr_1555) != null)
            {
                return (_SafeStr_4563);
            };
            return (null);
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_roomEvents.getXmlWindow("ude_main"));
            _configureContainer = _SafeStr_3133(find(_window, "configure_container"));
            Util.setProcDirectly(find(_configureContainer, "save_button"), onSave);
            Util.setProcDirectly(find(_configureContainer, "cancel_save_button"), onWindowClose);
            Util.setProcDirectly(find(_configureContainer, "helplink"), onHelp);
            Util.setProcDirectly(find(_configureContainer, "apply_snapshot_txt"), onApplySnapshot);
            Util.setProcDirectly(find(_configureContainer, "dec_stuff_sel_button"), onDecStuffSelectionType);
            Util.setProcDirectly(find(_configureContainer, "inc_stuff_sel_button"), onIncStuffSelectionType);
            find(_configureContainer, "helplink").mouseThreshold = 0;
            find(_configureContainer, "apply_snapshot_txt").mouseThreshold = 0;
            _SafeStr_4564 = new SliderWindowController(_roomEvents, _SafeStr_3133(find(_configureContainer, "delay_slider_container")), _roomEvents.assets, 0, 20, 1);
            _SafeStr_4564.addEventListener("change", onDelaySliderChange);
            _SafeStr_4564.setValue(0);
            setIcon("configure_container", "icon_trigger", "trigger_icon_bitmap");
            setIcon("configure_container", "icon_action", "action_icon_bitmap");
            setIcon("configure_container", "icon_condition", "condition_icon_bitmap");
            var _local_1:_SafeStr_3109 = _window.findChildByTag("close");
            _local_1.procedure = onWindowClose;
            _window.center();
        }

        private function onDelaySliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_5:Number;
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_5 = _local_2.getValue();
                    _local_4 = _local_5;
                    _local_3 = _SafeStr_3287.getSecsFromPulses(_local_4);
                    _roomEvents.localization.registerParameter("wiredfurni.params.delay", "seconds", _local_3);
                };
            };
        }

        private function setIcon(_arg_1:String, _arg_2:String, _arg_3:String="icon_bitmap"):void
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(find(_window, _arg_1));
            _roomEvents.refreshButton(_local_4, _arg_3, true, null, 0, _arg_2);
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
                _SafeStr_4559.hideAll(_SafeStr_4558);
            };
        }

        private function find(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3109
        {
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (_local_3 == null)
            {
                throw (new Error((("Window element with name: " + _arg_2) + " cannot be found!")));
            };
            return (_local_3);
        }

        public function prepareForUpdate(_arg_1:_SafeStr_1554):void
        {
            var _local_3:* = null;
            var _local_5:int;
            prepareWindow();
            _SafeStr_4560 = _arg_1;
            _SafeStr_14.log(((("Received: " + _SafeStr_4560) + ", ") + _arg_1.code));
            var _local_6:_SafeStr_3285 = resolveType();
            _SafeStr_4559.hideAll(_SafeStr_4558);
            _SafeStr_4558 = new Dictionary();
            for each (var _local_2:int in _SafeStr_4560.stuffIds)
            {
                _SafeStr_4558[_local_2] = "yes";
            };
            var _local_4:_SafeStr_3133 = ((_local_6.hasSpecialInputs) ? this.prepareCustomInput() : null);
            _local_6.onEditStart(_local_4, _SafeStr_4560);
            _SafeStr_4559.showAll(_SafeStr_4558);
            if ((_SafeStr_4560 as _SafeStr_1593) != null)
            {
                _local_3 = _SafeStr_1593(_SafeStr_4560);
                _local_5 = _local_3.delayInPulses;
                _SafeStr_4564.setValue(_local_5);
            };
            prepareStuffSelectionForUpdate();
            refresh();
        }

        private function prepareStuffSelectionForUpdate():void
        {
            var _local_2:* = null;
            getFurniTypeMatchesText().visible = false;
            getIncStuffSelTxt().visible = false;
            getDecStuffSelTxt().visible = false;
            if (_SafeStr_4560.stuffTypeSelectionEnabled)
            {
                _local_2 = resolveType();
                if (((_local_2.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE) || (_local_2.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT)))
                {
                    getIncStuffSelTxt().visible = true;
                    getDecStuffSelTxt().visible = true;
                    getFurniTypeMatchesText().visible = true;
                    refreshStuffTypeSelectionToggler();
                };
            };
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_configureContainer.findChildByName("select_furni_container"));
            _local_1.height = Util.getLowestPoint(_local_1);
        }

        private function refreshStuffTypeSelectionToggler():void
        {
            var _local_5:_SafeStr_3285 = resolveType();
            var _local_4:String = (((_local_5 as ActionType) != null) ? "effect" : (((_local_5 as _SafeStr_3286) != null) ? "trigger" : "condition"));
            var _local_2:String = "wiredfurni.pickfurnis.";
            var _local_3:String = ((((_local_2 + _local_4) + _local_5.code) + ".") + _SafeStr_4560.stuffTypeSelectionCode);
            var _local_1:String = _roomEvents.localization.getLocalization(_local_3, "");
            _SafeStr_14.log(((("Searching with key I: " + _local_3) + " got ") + _local_1));
            if (_local_1 == "")
            {
                _local_3 = (((_local_2 + _local_4) + ".") + _SafeStr_4560.stuffTypeSelectionCode);
                _local_1 = _roomEvents.localization.getLocalization(_local_3, _local_3);
                _SafeStr_14.log(((("Searching with key II: " + _local_3) + " got ") + _local_1));
            };
            getFurniTypeMatchesText().caption = _local_1;
        }

        public function stuffRemoved(_arg_1:int):void
        {
            if (_window == null)
            {
                return;
            };
            if (!_window.visible)
            {
                return;
            };
            if (_SafeStr_4560.id == _arg_1)
            {
                _window.visible = false;
                return;
            };
            if (_SafeStr_4558[_arg_1])
            {
                delete _SafeStr_4558[_arg_1];
                refresh();
            };
        }

        private function onSave(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!isOwner(_SafeStr_4560.id))
            {
                _roomEvents.windowManager.confirm("${wiredfurni.nonowner.change.confirm.title}", "${wiredfurni.nonowner.change.confirm.body}", 0, confirmCallback);
            }
            else
            {
                update();
            };
        }

        private function confirmCallback(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            if (_arg_2.type == "WE_OK")
            {
                update();
            };
        }

        private function update():void
        {
            var _local_2:_SafeStr_3285 = resolveType();
            var _local_1:String = _local_2.validate(((_local_2.hasSpecialInputs) ? prepareCustomInput() : null), _roomEvents);
            if (_local_1 != null)
            {
                _roomEvents.windowManager.alert("Update failed", _local_1, 0, null);
                return;
            };
            if ((_SafeStr_4560 as _SafeStr_1592) != null)
            {
                _roomEvents.send(new _SafeStr_222(_SafeStr_4560.id, resolveIntParams(), resolveStringParam(), getStuffIds(), resolveStuffSelectionType()));
            }
            else
            {
                if ((_SafeStr_4560 as _SafeStr_1593) != null)
                {
                    _roomEvents.send(new _SafeStr_427(_SafeStr_4560.id, resolveIntParams(), resolveStringParam(), getStuffIds(), getActionDelay(), resolveStuffSelectionType()));
                }
                else
                {
                    if ((_SafeStr_4560 as _SafeStr_1555) != null)
                    {
                        _roomEvents.send(new _SafeStr_1017(_SafeStr_4560.id, resolveIntParams(), resolveStringParam(), getStuffIds(), resolveStuffSelectionType()));
                    };
                };
            };
        }

        public function getActionDelay():int
        {
            var _local_1:ActionType = ActionType(this.resolveType());
            return ((_local_1.allowDelaying) ? _SafeStr_4564.getValue() : 0);
        }

        private function onHelp(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _help.open(((_window.x + _window.width) + 5), _window.y);
        }

        private function onDecStuffSelectionType(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:_SafeStr_3285 = this.resolveType();
            _SafeStr_4560.stuffTypeSelectionCode = ((_SafeStr_4560.stuffTypeSelectionCode < 1) ? (_local_3.requiresFurni - 1) : (_SafeStr_4560.stuffTypeSelectionCode - 1));
            refreshStuffTypeSelectionToggler();
        }

        private function onIncStuffSelectionType(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:_SafeStr_3285 = this.resolveType();
            _SafeStr_4560.stuffTypeSelectionCode = ((_SafeStr_4560.stuffTypeSelectionCode + 1) % _local_3.requiresFurni);
            refreshStuffTypeSelectionToggler();
        }

        private function onApplySnapshot(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _roomEvents.send(new _SafeStr_565(_SafeStr_4560.id));
        }

        private function resolveIntParams():Array
        {
            var _local_2:_SafeStr_3285 = resolveType();
            var _local_1:_SafeStr_3133 = ((_local_2.hasSpecialInputs) ? prepareCustomInput() : null);
            return (_local_2.readIntParamsFromForm(_local_1));
        }

        private function resolveStringParam():String
        {
            var _local_2:_SafeStr_3285 = resolveType();
            var _local_1:_SafeStr_3133 = ((_local_2.hasSpecialInputs) ? prepareCustomInput() : null);
            return (_local_2.readStringParamFromForm(_local_1));
        }

        private function resolveStuffSelectionType():int
        {
            if (!_SafeStr_4560.stuffTypeSelectionEnabled)
            {
                return (0);
            };
            var _local_1:_SafeStr_3285 = resolveType();
            if (((_local_1.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE) || (_local_1.requiresFurni == STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT)))
            {
                return (_SafeStr_4560.stuffTypeSelectionCode);
            };
            return (0);
        }

        public function getStuffIds():Array
        {
            var _local_2:Array = [];
            for (var _local_1:String in _SafeStr_4558)
            {
                _local_2.push(_local_1);
            };
            return (_local_2);
        }

        public function refresh():void
        {
            _configureContainer.visible = false;
            refreshConfigureElement(_SafeStr_4561);
            refreshConfigureElement(_SafeStr_4562);
            refreshConfigureElement(_SafeStr_4563);
            _window.content.height = Util.getLowestPoint(_window.content);
            _window.visible = true;
        }

        private function refreshConfigureElement(_arg_1:_SafeStr_3326):void
        {
            if (!_arg_1.acceptTriggerable(_SafeStr_4560))
            {
                find(_configureContainer, (_arg_1.getKey() + "_icon_bitmap")).visible = false;
                return;
            };
            _configureContainer.visible = true;
            var _local_2:_SafeStr_3285 = resolveType();
            refreshHeader(_local_2, _arg_1.getKey());
            refreshCustomInputs();
            refreshSelectFurni();
            find(_configureContainer, "warning_container").visible = false;
            refreshConflictingTriggers();
            refreshConflictingActions();
            refreshActionInputs();
            Util.moveAllChildrenToColumn(_configureContainer, 3, 5);
            _configureContainer.height = (Util.getLowestPoint(_configureContainer) + 1);
        }

        private function getElementName(_arg_1:int):String
        {
            var _local_2:_SafeStr_3130 = _roomEvents.sessionDataManager.getFloorItemData(_arg_1);
            if (_local_2 == null)
            {
                _SafeStr_14.log(("COULD NOT FIND FURNIDATA FOR " + _arg_1));
                return ("NAME: " + _arg_1);
            };
            return (_local_2.localizedName);
        }

        private function getElementDesc(_arg_1:int):String
        {
            var _local_2:_SafeStr_3130 = _roomEvents.sessionDataManager.getFloorItemData(_arg_1);
            if (_local_2 == null)
            {
                _SafeStr_14.log(("COULD NOT FIND FURNIDATA FOR " + _arg_1));
                return ("NAME: " + _arg_1);
            };
            return (_local_2.description);
        }

        private function setText(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:String):void
        {
            var _local_4:ITextWindow = ITextWindow(find(_arg_1, _arg_2));
            _local_4.caption = _arg_3;
            _local_4.height = (_local_4.textHeight + 6);
        }

        private function refreshHeader(_arg_1:_SafeStr_3285, _arg_2:String):void
        {
            var _local_6:_SafeStr_3133 = _SafeStr_3133(find(_configureContainer, "header_container"));
            find(_local_6, (_arg_2 + "_icon_bitmap")).visible = true;
            setText(_local_6, "conf_name_txt", getElementName(_SafeStr_4560.stuffTypeId));
            setText(_local_6, "conf_desc_txt", getElementDesc(_SafeStr_4560.stuffTypeId));
            var _local_4:_SafeStr_3109 = find(_local_6, "conf_name_txt");
            var _local_3:_SafeStr_3109 = find(_local_6, "conf_desc_txt");
            _local_3.y = (_local_4.y + _local_4.height);
            var _local_7:_SafeStr_3285 = this.resolveType();
            var _local_5:_SafeStr_3109 = find(_local_6, "apply_snapshot_txt");
            if (_local_7.hasStateSnapshot)
            {
                _local_5.visible = true;
                _local_5.y = (_local_3.y + _local_3.height);
            }
            else
            {
                _local_5.visible = false;
            };
            _local_6.height = (Util.getLowestPoint(_local_6) + 4);
        }

        private function refreshActionInputs():void
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(find(_configureContainer, "action_inputs_container"));
            if ((_SafeStr_4560 as _SafeStr_1593) == null)
            {
                _local_1.visible = false;
                return;
            };
            var _local_2:ActionType = ActionType(this.resolveType());
            if (!_local_2.allowDelaying)
            {
                _local_1.visible = false;
                return;
            };
            _local_1.visible = true;
        }

        private function refreshConflictingTriggers():void
        {
            if ((_SafeStr_4560 as _SafeStr_1593) == null)
            {
                return;
            };
            var _local_1:_SafeStr_1593 = _SafeStr_1593(_SafeStr_4560);
            if (_local_1.conflictingTriggers.length < 1)
            {
                return;
            };
            var _local_3:String = "";
            var _local_4:Boolean = true;
            for each (var _local_2:int in _local_1.conflictingTriggers)
            {
                _local_3 = (_local_3 + (((((_local_4) ? "" : ", ") + "'") + getElementName(_local_2)) + "'"));
                _local_4 = false;
            };
            _roomEvents.localization.registerParameter("wiredfurni.conflictingtriggers.text", "triggers", _local_3);
            refreshWarning(_roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.caption"), _roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.text"));
        }

        private function refreshConflictingActions():void
        {
            if ((_SafeStr_4560 as _SafeStr_1592) == null)
            {
                return;
            };
            var _local_1:_SafeStr_1592 = _SafeStr_1592(_SafeStr_4560);
            if (_local_1.conflictingActions.length < 1)
            {
                return;
            };
            var _local_3:String = "";
            var _local_4:Boolean = true;
            for each (var _local_2:int in _local_1.conflictingActions)
            {
                _local_3 = (_local_3 + (((((_local_4) ? "" : ", ") + "'") + getElementName(_local_2)) + "'"));
                _local_4 = false;
            };
            _roomEvents.localization.registerParameter("wiredfurni.conflictingactions.text", "actions", _local_3);
            refreshWarning(_roomEvents.localization.getLocalization("wiredfurni.conflictingactions.caption"), _roomEvents.localization.getLocalization("wiredfurni.conflictingactions.text"));
        }

        private function refreshWarning(_arg_1:String, _arg_2:String):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(find(_configureContainer, "warning_container"));
            setText(_local_3, "caption_txt", _arg_1);
            setText(_local_3, "desc_txt", _arg_2);
            var _local_4:_SafeStr_3109 = find(_local_3, "caption_txt");
            find(_local_3, "desc_txt").y = (_local_4.y + _local_4.height);
            _local_3.height = (Util.getLowestPoint(_local_3) + 4);
            find(_configureContainer, "warning_container").visible = true;
        }

        private function refreshCustomInputs():void
        {
            var _local_1:* = null;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_configureContainer.findChildByName("custom_inputs_container"));
            Util.hideChildren(_local_2);
            if (resolveType().hasSpecialInputs)
            {
                _local_1 = prepareCustomInput();
                _local_1.visible = true;
            };
            _local_2.height = Util.getLowestPoint(_local_2);
        }

        private function prepareCustomInput():_SafeStr_3133
        {
            var _local_3:_SafeStr_3326 = resolveHolder();
            var _local_4:_SafeStr_3285 = resolveType();
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_configureContainer.findChildByName("custom_inputs_container"));
            var _local_5:String = (_local_3.getKey() + _local_4.code);
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_local_2.getChildByName(_local_5));
            if (_local_1 == null)
            {
                _local_1 = _SafeStr_3133(_roomEvents.getXmlWindow(((("ude_" + _local_3.getKey()) + "_inputs_") + _local_4.code)));
                _local_1.name = _local_5;
                _local_2.addChild(_local_1);
                _local_4.onInit(_local_1, _roomEvents);
            };
            return (_local_1);
        }

        private function refreshSelectFurni():void
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_configureContainer.findChildByName("select_furni_container"));
            if (!isStuffSelectionMode())
            {
                _local_1.visible = false;
                return;
            };
            _local_1.visible = true;
            var _local_2:_SafeStr_3109 = _local_1.findChildByName("furni_name_txt");
            var _local_4:int = this.getStuffIds().length;
            var _local_3:int = _SafeStr_4560.furniLimit;
            _roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption", "count", ("" + _local_4));
            _roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption", "limit", ("" + _local_3));
        }

        private function getDecStuffSelTxt():_SafeStr_3109
        {
            return (_configureContainer.findChildByName("dec_stuff_sel_button"));
        }

        private function getIncStuffSelTxt():_SafeStr_3109
        {
            return (_configureContainer.findChildByName("inc_stuff_sel_button"));
        }

        private function getFurniTypeMatchesText():_SafeStr_3109
        {
            return (_configureContainer.findChildByName("furni_type_matches_txt"));
        }

        private function isOwner(_arg_1:int):Boolean
        {
            var _local_4:IRoomObject = _roomEvents.roomEngine.getRoomObject(_roomEvents.roomId, _arg_1, 10);
            if (_local_4 == null)
            {
                return (false);
            };
            var _local_3:IRoomObjectModel = _local_4.getModel();
            if (_local_3 == null)
            {
                return (false);
            };
            var _local_2:Number = _local_4.getModel().getNumber("furniture_owner_id");
            return (_local_2 == _roomEvents.sessionDataManager.userId);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents

// _SafeStr_1017 = "_-02P" (String#28372, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_1555 = "_-IL" (String#23531, DoABC#4)
// _SafeStr_1592 = "_-22A" (String#13704, DoABC#4)
// _SafeStr_1593 = "_-S8" (String#7622, DoABC#4)
// _SafeStr_222 = "_-S1m" (String#29567, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)
// _SafeStr_3286 = "_-C1W" (String#11131, DoABC#4)
// _SafeStr_3287 = "_-02y" (String#7463, DoABC#4)
// _SafeStr_3326 = "_-L17" (String#8542, DoABC#4)
// _SafeStr_427 = "_-rM" (String#28469, DoABC#4)
// _SafeStr_4558 = "_-It" (String#4953, DoABC#4)
// _SafeStr_4559 = "_-G1A" (String#10110, DoABC#4)
// _SafeStr_4560 = "_-74" (String#2187, DoABC#4)
// _SafeStr_4561 = "_-gR" (String#14163, DoABC#4)
// _SafeStr_4562 = "_-h1g" (String#15197, DoABC#4)
// _SafeStr_4563 = "_-QQ" (String#15200, DoABC#4)
// _SafeStr_4564 = "_-H1E" (String#11116, DoABC#4)
// _SafeStr_565 = "_-IJ" (String#30360, DoABC#4)


