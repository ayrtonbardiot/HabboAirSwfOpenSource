// by nota

//com.sulake.habbo.room.object.logic.AvatarLogic

package com.sulake.habbo.room.object.logic
{
    import com.sulake.room.utils.Vector3d;
    import flash.utils.getTimer;
    import com.sulake.habbo.room.events.RoomObjectMoveEvent;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGuideStatusUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarOwnMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;

    public class AvatarLogic extends MovingObjectLogic 
    {

        private static const _SafeStr_8741:Number = 1.5;
        private static const EFFECT_TYPE_SPLASH:int = 28;
        private static const EFFECT_TYPE_SWIM:int = 29;
        private static const _SafeStr_8742:int = 184;
        private static const _SafeStr_8743:int = 185;
        private static const EFFECT_SPLASH_LENGTH:int = 500;
        private static const CARRY_ITEM_NULL:int = 0;
        private static const CARRY_ITEM_LAST_CONSUMABLE:int = 999;
        private static const CARRY_ITEM_EMPTY_HAND:int = 999999999;
        private static const CARRY_ITEM_DELAY_BEFORE_USE:int = 5000;
        private static const CARRY_ITEM_EMPTY_HAND_ANIMATION_LENGTH:int = 1500;

        private var _selected:Boolean = false;
        private var _SafeStr_4922:Vector3d = null;
        private var _SafeStr_4931:int = 0;
        private var _SafeStr_4932:int = 0;
        private var _SafeStr_4923:int = 0;
        private var _SafeStr_4924:int = 0;
        private var _SafeStr_4925:int = 0;
        private var _SafeStr_4920:int = 0;
        private var _SafeStr_4926:int = 0;
        private var _SafeStr_4927:int = 0;
        private var _SafeStr_4921:int = 0;
        private var _SafeStr_4928:int = 0;
        private var _allowUseCarryObject:Boolean = false;
        private var _SafeStr_4930:int = 0;
        private var _SafeStr_4929:int = 0;
        private var _SafeStr_4933:int = 0;

        public function AvatarLogic()
        {
            _SafeStr_4929 = (getTimer() + getBlinkInterval());
        }

        override public function getEventTypes():Array
        {
            var _local_1:Array = ["ROE_MOUSE_CLICK", "ROME_POSITION_CHANGED", "ROE_MOUSE_ENTER", "ROE_MOUSE_LEAVE", "ROFCAE_MOUSE_BUTTON", "ROFCAE_MOUSE_ARROW"];
            return (getAllEventTypes(super.getEventTypes(), _local_1));
        }

        override public function dispose():void
        {
            var _local_1:* = null;
            if (((_selected) && (!(object == null))))
            {
                if (eventDispatcher != null)
                {
                    _local_1 = new RoomObjectMoveEvent("ROME_OBJECT_REMOVED", object);
                    eventDispatcher.dispatchEvent(_local_1);
                };
            };
            super.dispose();
            _SafeStr_4922 = null;
        }

        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            var _local_10:* = null;
            var _local_22:* = null;
            var _local_26:* = null;
            var _local_11:* = null;
            var _local_2:* = null;
            var _local_18:* = null;
            var _local_17:* = null;
            var _local_12:* = null;
            var _local_13:* = null;
            var _local_23:* = null;
            var _local_4:* = null;
            var _local_25:int;
            var _local_9:int;
            var _local_24:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_20:* = null;
            var _local_21:Number;
            var _local_15:* = null;
            var _local_16:* = null;
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_19:* = null;
            var _local_3:* = null;
            if (((_arg_1 == null) || (object == null)))
            {
                return;
            };
            super.processUpdateMessage(_arg_1);
            var _local_14:IRoomObjectModelController = object.getModelController();
            if ((_arg_1 is RoomObjectAvatarPostureUpdateMessage))
            {
                _local_10 = (_arg_1 as RoomObjectAvatarPostureUpdateMessage);
                _local_14.setString("figure_posture", _local_10.postureType);
                _local_14.setString("figure_posture_parameter", _local_10.parameter);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarChatUpdateMessage))
            {
                _local_22 = (_arg_1 as RoomObjectAvatarChatUpdateMessage);
                _local_14.setNumber("figure_talk", 1);
                _SafeStr_4923 = (getTimer() + (_local_22.numberOfWords * 1000));
                return;
            };
            if ((_arg_1 is RoomObjectAvatarTypingUpdateMessage))
            {
                _local_26 = (_arg_1 as RoomObjectAvatarTypingUpdateMessage);
                _local_14.setNumber("figure_is_typing", _local_26.isTyping);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarMutedUpdateMessage))
            {
                _local_11 = (_arg_1 as RoomObjectAvatarMutedUpdateMessage);
                _local_14.setNumber("figure_is_muted", _local_11.isMuted);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarPlayingGameMessage))
            {
                _local_2 = (_arg_1 as RoomObjectAvatarPlayingGameMessage);
                _local_14.setNumber("figure_is_playing_game", _local_2.isPlayingGame);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarUpdateMessage))
            {
                _local_18 = (_arg_1 as RoomObjectAvatarUpdateMessage);
                _local_14.setNumber("head_direction", _local_18.dirHead);
                _local_14.setNumber("figure_can_stand_up", _local_18.canStandUp);
                _local_14.setNumber("figure_vertical_offset", _local_18.baseY);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarGestureUpdateMessage))
            {
                _local_17 = (_arg_1 as RoomObjectAvatarGestureUpdateMessage);
                _local_14.setNumber("figure_gesture", _local_17.gesture);
                _SafeStr_4926 = (getTimer() + 3000);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarExpressionUpdateMessage))
            {
                _local_14.setNumber("figure_expression", RoomObjectAvatarExpressionUpdateMessage(_arg_1).expressionType);
                _SafeStr_4920 = AvatarAction.getExpressionTime(_local_14.getNumber("figure_expression"));
                if (_SafeStr_4920 > -1)
                {
                    _SafeStr_4920 = (_SafeStr_4920 + getTimer());
                };
                return;
            };
            if ((_arg_1 is RoomObjectAvatarDanceUpdateMessage))
            {
                _local_12 = (_arg_1 as RoomObjectAvatarDanceUpdateMessage);
                _local_14.setNumber("figure_dance", _local_12.danceStyle);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarSleepUpdateMessage))
            {
                _local_13 = (_arg_1 as RoomObjectAvatarSleepUpdateMessage);
                _local_14.setNumber("figure_sleep", _local_13.isSleeping);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarPlayerValueUpdateMessage))
            {
                _local_23 = (_arg_1 as RoomObjectAvatarPlayerValueUpdateMessage);
                _local_14.setNumber("figure_number_value", _local_23.value);
                _SafeStr_4933 = (getTimer() + 3000);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarEffectUpdateMessage))
            {
                _local_4 = (_arg_1 as RoomObjectAvatarEffectUpdateMessage);
                _local_25 = _local_4.effect;
                _local_9 = _local_4.delayMilliSeconds;
                updateEffect(_local_25, _local_9, _local_14);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarCarryObjectUpdateMessage))
            {
                _local_24 = (_arg_1 as RoomObjectAvatarCarryObjectUpdateMessage);
                _local_14.setNumber("figure_carry_object", _local_24.itemType);
                _local_14.setNumber("figure_use_object", 0);
                _SafeStr_4921 = getTimer();
                if (_local_24.itemType < 999999999)
                {
                    _SafeStr_4928 = 0;
                    _allowUseCarryObject = (_local_24.itemType <= 999);
                }
                else
                {
                    _SafeStr_4928 = (_SafeStr_4921 + 1500);
                    _allowUseCarryObject = false;
                };
                return;
            };
            if ((_arg_1 is RoomObjectAvatarUseObjectUpdateMessage))
            {
                _local_7 = (_arg_1 as RoomObjectAvatarUseObjectUpdateMessage);
                _local_14.setNumber("figure_use_object", _local_7.itemType);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarSignUpdateMessage))
            {
                _local_5 = (_arg_1 as RoomObjectAvatarSignUpdateMessage);
                _local_14.setNumber("figure_sign", _local_5.signType);
                _SafeStr_4927 = (getTimer() + 5000);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarFlatControlUpdateMessage))
            {
                _local_20 = (_arg_1 as RoomObjectAvatarFlatControlUpdateMessage);
                _local_21 = parseInt(_local_20.rawData);
                if ((((_local_21 == _local_21) && (_local_21 >= 0)) && (_local_21 <= 5)))
                {
                    _local_14.setNumber("figure_flat_control", _local_21);
                }
                else
                {
                    _local_14.setNumber("figure_flat_control", 0);
                };
                return;
            };
            if ((_arg_1 is RoomObjectAvatarFigureUpdateMessage))
            {
                _local_15 = (_arg_1 as RoomObjectAvatarFigureUpdateMessage);
                _local_16 = _local_14.getString("figure");
                _local_8 = _local_15.figure;
                _local_6 = _local_15.gender;
                if (((!(_local_16 == null)) && (!(_local_16.indexOf(".bds-") == -1))))
                {
                    _local_8 = (_local_8 + _local_16.substr(_local_16.indexOf(".bds-")));
                };
                _local_14.setString("figure", _local_8);
                _local_14.setString("gender", _local_6);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarSelectedMessage))
            {
                _local_19 = (_arg_1 as RoomObjectAvatarSelectedMessage);
                _selected = _local_19.selected;
                _SafeStr_4922 = null;
                return;
            };
            if ((_arg_1 is RoomObjectAvatarGuideStatusUpdateMessage))
            {
                _local_3 = (_arg_1 as RoomObjectAvatarGuideStatusUpdateMessage);
                _local_14.setNumber("figure_guide_status", _local_3.guideStatus);
                return;
            };
            if ((_arg_1 is RoomObjectAvatarOwnMessage))
            {
                _local_14.setNumber("own_user", 1);
                return;
            };
        }

        private function updateEffect(_arg_1:int, _arg_2:int, _arg_3:IRoomObjectModelController):void
        {
            if (_arg_1 == 28)
            {
                _SafeStr_4931 = (getTimer() + 500);
                _SafeStr_4932 = 29;
            }
            else
            {
                if (_arg_1 == 184)
                {
                    _SafeStr_4931 = (getTimer() + 500);
                    _SafeStr_4932 = 185;
                }
                else
                {
                    if (_arg_3.getNumber("figure_effect") == 29)
                    {
                        _SafeStr_4931 = (getTimer() + 500);
                        _SafeStr_4932 = _arg_1;
                        _arg_1 = 28;
                    }
                    else
                    {
                        if (_arg_3.getNumber("figure_effect") == 185)
                        {
                            _SafeStr_4931 = (getTimer() + 500);
                            _SafeStr_4932 = _arg_1;
                            _arg_1 = 184;
                        }
                        else
                        {
                            if (_arg_2 == 0)
                            {
                                _SafeStr_4931 = 0;
                            }
                            else
                            {
                                _SafeStr_4931 = (getTimer() + _arg_2);
                                _SafeStr_4932 = _arg_1;
                                return;
                            };
                        };
                    };
                };
            };
            _arg_3.setNumber("figure_effect", _arg_1);
        }

        override public function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_5:* = null;
            if (((object == null) || (_arg_1 == null)))
            {
                return;
            };
            var _local_3:IRoomObjectModelController = object.getModelController();
            var _local_4:String;
            switch (_arg_1.type)
            {
                case "click":
                    _local_4 = "ROE_MOUSE_CLICK";
                    break;
                case "rollOver":
                    _local_4 = "ROE_MOUSE_ENTER";
                    if (_local_3 != null)
                    {
                        _local_3.setNumber("figure_highlight", 1);
                    };
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent("ROFCAE_MOUSE_BUTTON", object));
                    break;
                case "rollOut":
                    if (_local_3 != null)
                    {
                        _local_3.setNumber("figure_highlight", 0);
                    };
                    _local_4 = "ROE_MOUSE_LEAVE";
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent("ROFCAE_MOUSE_ARROW", object));
            };
            if (_local_4 != null)
            {
                if (eventDispatcher != null)
                {
                    _local_5 = new RoomObjectMouseEvent(_local_4, object, _arg_1.eventId, _arg_1.altKey, _arg_1.ctrlKey, _arg_1.shiftKey, _arg_1.buttonDown);
                    eventDispatcher.dispatchEvent(_local_5);
                };
            };
        }

        override public function update(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            super.update(_arg_1);
            if (((_selected) && (!(object == null))))
            {
                if (eventDispatcher != null)
                {
                    _local_2 = object.getLocation();
                    if (((((_SafeStr_4922 == null) || (!(_SafeStr_4922.x == _local_2.x))) || (!(_SafeStr_4922.y == _local_2.y))) || (!(_SafeStr_4922.z == _local_2.z))))
                    {
                        if (_SafeStr_4922 == null)
                        {
                            _SafeStr_4922 = new Vector3d();
                        };
                        _SafeStr_4922.assign(_local_2);
                        _local_4 = new RoomObjectMoveEvent("ROME_POSITION_CHANGED", object);
                        eventDispatcher.dispatchEvent(_local_4);
                    };
                };
            };
            if (object != null)
            {
                _local_3 = object.getModelController();
                if (_local_3 != null)
                {
                    updateActions(_arg_1, _local_3);
                };
            };
        }

        private function updateActions(_arg_1:int, _arg_2:IRoomObjectModelController):void
        {
            if (_SafeStr_4923 > 0)
            {
                if (_arg_1 > _SafeStr_4923)
                {
                    _arg_2.setNumber("figure_talk", 0);
                    _SafeStr_4923 = 0;
                    _SafeStr_4925 = 0;
                    _SafeStr_4924 = 0;
                }
                else
                {
                    if (((_SafeStr_4924 == 0) && (_SafeStr_4925 == 0)))
                    {
                        _SafeStr_4925 = (_arg_1 + getTalkingPauseInterval());
                        _SafeStr_4924 = (_SafeStr_4925 + getTalkingPauseLength());
                    }
                    else
                    {
                        if (((_SafeStr_4925 > 0) && (_arg_1 > _SafeStr_4925)))
                        {
                            _arg_2.setNumber("figure_talk", 0);
                            _SafeStr_4925 = 0;
                        }
                        else
                        {
                            if (((_SafeStr_4924 > 0) && (_arg_1 > _SafeStr_4924)))
                            {
                                _arg_2.setNumber("figure_talk", 1);
                                _SafeStr_4924 = 0;
                            };
                        };
                    };
                };
            };
            if (((_SafeStr_4920 > 0) && (_arg_1 > _SafeStr_4920)))
            {
                _arg_2.setNumber("figure_expression", 0);
                _SafeStr_4920 = 0;
            };
            if (((_SafeStr_4926 > 0) && (_arg_1 > _SafeStr_4926)))
            {
                _arg_2.setNumber("figure_gesture", 0);
                _SafeStr_4926 = 0;
            };
            if (((_SafeStr_4927 > 0) && (_arg_1 > _SafeStr_4927)))
            {
                _arg_2.setNumber("figure_sign", -1);
                _SafeStr_4927 = 0;
            };
            if (_SafeStr_4928 > 0)
            {
                if (_arg_1 > _SafeStr_4928)
                {
                    _arg_2.setNumber("figure_carry_object", 0);
                    _arg_2.setNumber("figure_use_object", 0);
                    _SafeStr_4921 = (_SafeStr_4928 = 0);
                    _allowUseCarryObject = false;
                };
            };
            if (_allowUseCarryObject)
            {
                if ((_arg_1 - _SafeStr_4921) > 5000)
                {
                    if (((_arg_1 - _SafeStr_4921) % 10000) < 1000)
                    {
                        _arg_2.setNumber("figure_use_object", 1);
                    }
                    else
                    {
                        _arg_2.setNumber("figure_use_object", 0);
                    };
                };
            };
            if (_arg_1 > _SafeStr_4929)
            {
                _arg_2.setNumber("figure_blink", 1);
                _SafeStr_4929 = (_arg_1 + getBlinkInterval());
                _SafeStr_4930 = (_arg_1 + getBlinkLength());
            };
            if (((_SafeStr_4930 > 0) && (_arg_1 > _SafeStr_4930)))
            {
                _arg_2.setNumber("figure_blink", 0);
                _SafeStr_4930 = 0;
            };
            if (((_SafeStr_4931 > 0) && (_arg_1 > _SafeStr_4931)))
            {
                _arg_2.setNumber("figure_effect", _SafeStr_4932);
                _SafeStr_4931 = 0;
            };
            if (((_SafeStr_4933 > 0) && (_arg_1 > _SafeStr_4933)))
            {
                _arg_2.setNumber("figure_number_value", 0);
                _SafeStr_4933 = 0;
            };
        }

        private function getTalkingPauseInterval():int
        {
            return (100 + (Math.random() * 200));
        }

        private function getTalkingPauseLength():int
        {
            return (75 + (Math.random() * 75));
        }

        private function getBlinkInterval():int
        {
            return (4500 + (Math.random() * 1000));
        }

        private function getBlinkLength():int
        {
            return (50 + (Math.random() * 200));
        }

        private function targetIsWarping(_arg_1:IVector3d):Boolean
        {
            var _local_2:IVector3d = object.getLocation();
            if (_arg_1 == null)
            {
                return (false);
            };
            if (((_local_2.x == 0) && (_local_2.y == 0)))
            {
                return (false);
            };
            if (((Math.abs((_local_2.x - _arg_1.x)) > 1.5) || (Math.abs((_local_2.y - _arg_1.y)) > 1.5)))
            {
                return (true);
            };
            return (false);
        }


    }
}//package com.sulake.habbo.room.object.logic

// _SafeStr_4920 = "_-ex" (String#7037, DoABC#4)
// _SafeStr_4921 = "_-B14" (String#8819, DoABC#4)
// _SafeStr_4922 = "_-k1X" (String#3083, DoABC#4)
// _SafeStr_4923 = "_-cA" (String#5312, DoABC#4)
// _SafeStr_4924 = "_-59" (String#7285, DoABC#4)
// _SafeStr_4925 = "_-wG" (String#6910, DoABC#4)
// _SafeStr_4926 = "_-qX" (String#5420, DoABC#4)
// _SafeStr_4927 = "_-bR" (String#10365, DoABC#4)
// _SafeStr_4928 = "_-R1I" (String#8114, DoABC#4)
// _SafeStr_4929 = "_-Q7" (String#13186, DoABC#4)
// _SafeStr_4930 = "_-8U" (String#10353, DoABC#4)
// _SafeStr_4931 = "_-u1w" (String#4551, DoABC#4)
// _SafeStr_4932 = "_-7y" (String#5950, DoABC#4)
// _SafeStr_4933 = "_-XL" (String#11350, DoABC#4)
// _SafeStr_8741 = "_-91O" (String#33112, DoABC#4)
// _SafeStr_8742 = "_-91X" (String#33120, DoABC#4)
// _SafeStr_8743 = "_-Re" (String#39544, DoABC#4)


