// by nota

//com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization

package com.sulake.habbo.room.object.visualization.avatar
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar._SafeStr_3139;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation._SafeStr_3323;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.avatar.additions.FloatingIdleZ;
    import com.sulake.habbo.room.object.visualization.avatar.additions.MutedBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.TypingBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.GuideStatusBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.GameClickTarget;
    import com.sulake.habbo.room.object.visualization.avatar.additions.NumberBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions._SafeStr_3380;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.core.assets.IAsset;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.filters.GlowFilter;
    import flash.geom.Point;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.habbo.utils._SafeStr_3291;
    import com.sulake.habbo.avatar.enum.AvatarAction;

    public class AvatarVisualization extends RoomObjectSpriteVisualization implements _SafeStr_1875, _SafeStr_3139 
    {

        private static const AVATAR_SPRITE_TAG:String = "avatar";
        private static const AVATAR_SPRITE_DEFAULT_DEPTH:Number = -0.01;
        private static const AVATAR_OWN_DEPTH_ADJUST:Number = 0.001;
        private static const AVATAR_SPRITE_LAYING_DEPTH:Number = -0.409;
        private static const BASE_Y_SCALE:int = 1000;
        private static const ANIMATION_FRAME_UPDATE_INTERVAL:int = 2;
        private static const DEFAULT_CANVAS_OFFSETS:Array = [0, 0, 0];
        private static const SNOWBOARDING_EFFECT:int = 97;
        private static const MAX_AVATARS_WITH_EFFECT:int = 3;
        private static const SPRITE_INDEX_AVATAR:int = 0;
        private static const _SafeStr_8746:int = 1;
        private static const INITIAL_RESERVED_SPRITES:int = 2;
        private static const ADDITION_ID_IDLE_BUBBLE:int = 1;
        private static const ADDITION_ID_TYPING_BUBBLE:int = 2;
        private static const ADDITION_ID_EXPRESSION:int = 3;
        private static const ADDITION_ID_NUMBER_BUBBLE:int = 4;
        private static const ADDITION_ID_GAME_CLICK_TARGET:int = 5;
        private static const ADDITION_ID_MUTED_BUBBLE:int = 6;
        private static const ADDITION_ID_GUIDE_STATUS_BUBBLE:int = 7;

        private const _SafeStr_8747:int = 41;

        private var _lastUpdateTime:int = -1000;
        private var _SafeStr_5347:AvatarVisualizationData = null;
        private var _avatars:_SafeStr_24;
        private var _SafeStr_5331:_SafeStr_24;
        private var _updatesUntilFrameUpdate:int = 0;
        private var _SafeStr_4250:Boolean;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_5350:int = 0;
        private var _shadowAsset:BitmapDataAsset;
        private var _forceUpdate:Boolean;
        private var _headAngle:int = -1;
        private var _SafeStr_5336:int = -1;
        private var _SafeStr_5348:int = -1;
        private var _SafeStr_5349:int = 2;
        private var _SafeStr_5332:_SafeStr_24;
        private var _SafeStr_4072:int = -1;
        private var _SafeStr_4375:String = "";
        private var _SafeStr_5339:String = "";
        private var _SafeStr_5337:Boolean = false;
        private var _SafeStr_4876:Boolean = false;
        private var _SafeStr_5338:Boolean = false;
        private var _SafeStr_4790:int = 0;
        private var _SafeStr_4376:int = 0;
        private var _SafeStr_4126:int = 0;
        private var _SafeStr_5345:int = 0;
        private var _SafeStr_5344:Boolean = false;
        private var _SafeStr_4381:int = -1;
        private var _SafeStr_5341:int = 0;
        private var _SafeStr_5342:int = 0;
        private var _SafeStr_5343:int = 0;
        private var _geometryOffset:int = 0;
        private var _SafeStr_5334:int = 0;
        private var _SafeStr_5340:Boolean = false;
        private var _SafeStr_5335:Boolean = false;
        private var _SafeStr_5351:Boolean = false;
        private var _SafeStr_5333:_SafeStr_3138 = null;
        private var _SafeStr_5346:Boolean = false;
        private var _SafeStr_4036:Boolean;

        public function AvatarVisualization()
        {
            _avatars = new _SafeStr_24();
            _SafeStr_5331 = new _SafeStr_24();
            _SafeStr_4250 = false;
        }

        override public function dispose():void
        {
            if (_avatars != null)
            {
                resetImages();
                _avatars.dispose();
                _SafeStr_5331.dispose();
                _avatars = null;
            };
            _SafeStr_5347 = null;
            _shadowAsset = null;
            if (_SafeStr_5332)
            {
                for each (var _local_1:IAvatarAddition in _SafeStr_5332)
                {
                    _local_1.dispose();
                };
                _SafeStr_5332 = null;
            };
            super.dispose();
            _SafeStr_4036 = true;
        }

        override public function getSpriteList():Array
        {
            var _local_17:* = null;
            var _local_6:* = null;
            var _local_11:* = null;
            var _local_18:int;
            var _local_1:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_19:int;
            var _local_8:int;
            var _local_7:* = null;
            var _local_2:* = null;
            var _local_12:* = null;
            var _local_5:* = null;
            if (_SafeStr_5333 == null)
            {
                return (null);
            };
            var _local_3:IRoomObjectSprite = getSprite(1);
            if (_local_3)
            {
                _local_17 = new RoomObjectSpriteData();
                _local_17.alpha = _local_3.alpha;
                _local_17.x = _local_3.offsetX;
                _local_17.y = _local_3.offsetY;
                _local_17.name = _local_3.assetName;
                _local_17.width = _local_3.width;
                _local_17.height = _local_3.height;
            };
            var _local_9:Array = _SafeStr_5333.getServerRenderData();
            for each (var _local_10:ISpriteDataContainer in _SafeStr_5333.getSprites())
            {
                _local_6 = new RoomObjectSpriteData();
                _local_11 = _SafeStr_5333.getLayerData(_local_10);
                _local_18 = 0;
                _local_1 = _SafeStr_5333.getDirection();
                _local_13 = _local_10.getDirectionOffsetX(_local_1);
                _local_14 = _local_10.getDirectionOffsetY(_local_1);
                _local_15 = _local_10.getDirectionOffsetZ(_local_1);
                _local_19 = 0;
                if (_local_10.hasDirections)
                {
                    _local_19 = _local_1;
                };
                if (_local_11 != null)
                {
                    _local_18 = _local_11.animationFrame;
                    _local_13 = (_local_13 + _local_11.dx);
                    _local_14 = (_local_14 + _local_11.dy);
                    _local_19 = (_local_19 + _local_11.directionOffset);
                };
                _local_8 = 64;
                if (_local_8 < 48)
                {
                    _local_13 = int((_local_13 / 2));
                    _local_14 = int((_local_14 / 2));
                };
                if (_local_19 < 0)
                {
                    _local_19 = (_local_19 + 8);
                }
                else
                {
                    if (_local_19 > 7)
                    {
                        _local_19 = (_local_19 - 8);
                    };
                };
                _local_7 = ((((((_SafeStr_5333.getScale() + "_") + _local_10.member) + "_") + _local_19) + "_") + _local_18);
                _local_2 = _SafeStr_5333.getAsset(_local_7);
                if (_local_2 != null)
                {
                    _local_6.x = ((-(_local_2.offset.x) - (_local_8 / 2)) + _local_13);
                    _local_6.y = (-(_local_2.offset.y) + _local_14);
                    if (_local_10.hasStaticY)
                    {
                        _local_6.y = (_local_6.y + ((_SafeStr_5334 * _local_8) / (2 * 1000)));
                    };
                    if (_local_10.ink == 33)
                    {
                        _local_6.blendMode = "add";
                    };
                    _local_6.name = _local_7;
                    if (_SafeStr_5335)
                    {
                        _local_6.z = (-0.409 - ((0.001 * spriteCount) * _local_15));
                    }
                    else
                    {
                        _local_6.z = ((-0.001 * spriteCount) * _local_15);
                    };
                    _local_12 = _local_2.rectangle;
                    if (_local_12 == null)
                    {
                        _local_6.width = 60;
                        _local_6.height = 60;
                    }
                    else
                    {
                        _local_6.width = _local_12.width;
                        _local_6.height = _local_12.height;
                    };
                    _local_9.push(_local_6);
                };
            };
            var _local_4:_SafeStr_3323 = _SafeStr_5333.avatarSpriteData;
            if (((!(_local_4 == null)) && (_local_4.paletteIsGrayscale)))
            {
                _local_5 = _local_4.reds[0].toString();
                for each (var _local_16:RoomObjectSpriteData in _local_9)
                {
                    if (((_local_16.name.indexOf("h_std_fx") == -1) && (_local_16.name.indexOf("h_std_sd") == -1)))
                    {
                        _local_16.color = _local_5;
                    };
                };
            };
            if (_local_17)
            {
                _local_9.push(_local_17);
            };
            return (_local_9);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get angle():int
        {
            return (_SafeStr_5336);
        }

        public function get posture():String
        {
            return (_SafeStr_4375);
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            _SafeStr_5347 = (_arg_1 as AvatarVisualizationData);
            createSprites(2);
            return (true);
        }

        private function updateModel(_arg_1:IRoomObjectModel, _arg_2:Number, _arg_3:Boolean):Boolean
        {
            var _local_7:Boolean;
            var _local_4:Boolean;
            var _local_8:int;
            var _local_6:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            if (_arg_1.getUpdateID() != _SafeStr_4170)
            {
                _local_7 = false;
                _local_4 = false;
                _local_8 = 0;
                _local_6 = "";
                _local_4 = ((_arg_1.getNumber("figure_talk") > 0) && (_arg_3));
                if (_local_4 != _SafeStr_5337)
                {
                    _SafeStr_5337 = _local_4;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_expression");
                if (_local_8 != _SafeStr_4790)
                {
                    _SafeStr_4790 = _local_8;
                    _local_7 = true;
                };
                _local_4 = (_arg_1.getNumber("figure_sleep") > 0);
                if (_local_4 != _SafeStr_4876)
                {
                    _SafeStr_4876 = _local_4;
                    _local_7 = true;
                };
                _local_4 = ((_arg_1.getNumber("figure_blink") > 0) && (_arg_3));
                if (_local_4 != _SafeStr_5338)
                {
                    _SafeStr_5338 = _local_4;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_gesture");
                if (_local_8 != _SafeStr_4376)
                {
                    _SafeStr_4376 = _local_8;
                    _local_7 = true;
                };
                _local_6 = _arg_1.getString("figure_posture");
                if (_local_6 != _SafeStr_4375)
                {
                    _SafeStr_4375 = _local_6;
                    _local_7 = true;
                };
                _local_6 = _arg_1.getString("figure_posture_parameter");
                if (_local_6 != _SafeStr_5339)
                {
                    _SafeStr_5339 = _local_6;
                    _local_7 = true;
                };
                _local_4 = (_arg_1.getNumber("figure_can_stand_up") > 0);
                if (_local_4 != _SafeStr_5340)
                {
                    _SafeStr_5340 = _local_4;
                    _local_7 = true;
                };
                _local_8 = (_arg_1.getNumber("figure_vertical_offset") * 1000);
                if (_local_8 != _SafeStr_5334)
                {
                    _SafeStr_5334 = _local_8;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_dance");
                if (_local_8 != _SafeStr_4126)
                {
                    _SafeStr_4126 = _local_8;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_effect");
                if (_local_8 != _SafeStr_5341)
                {
                    _SafeStr_5341 = _local_8;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_carry_object");
                if (_local_8 != _SafeStr_5342)
                {
                    _SafeStr_5342 = _local_8;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("figure_use_object");
                if (_local_8 != _SafeStr_5343)
                {
                    _SafeStr_5343 = _local_8;
                    _local_7 = true;
                };
                _local_8 = _arg_1.getNumber("head_direction");
                if (_local_8 != _headAngle)
                {
                    _headAngle = _local_8;
                    _local_7 = true;
                };
                if (((_SafeStr_5342 > 0) && (_arg_1.getNumber("figure_use_object") > 0)))
                {
                    if (_SafeStr_5343 != _SafeStr_5342)
                    {
                        _SafeStr_5343 = _SafeStr_5342;
                        _local_7 = true;
                    };
                }
                else
                {
                    if (_SafeStr_5343 != 0)
                    {
                        _SafeStr_5343 = 0;
                        _local_7 = true;
                    };
                };
                _local_9 = (getAddition(1) as FloatingIdleZ);
                if (_SafeStr_4876)
                {
                    if (!_local_9)
                    {
                        _local_9 = addAddition(new FloatingIdleZ(1, this));
                    };
                    _local_7 = true;
                }
                else
                {
                    if (_local_9)
                    {
                        removeAddition(1);
                    };
                };
                _local_4 = (_arg_1.getNumber("figure_is_muted") > 0);
                _local_9 = (getAddition(6) as MutedBubble);
                if (_local_4)
                {
                    if (!_local_9)
                    {
                        _local_9 = addAddition(new MutedBubble(6, this));
                    };
                    removeAddition(2);
                    _local_7 = true;
                }
                else
                {
                    if (_local_9)
                    {
                        removeAddition(6);
                        _local_7 = true;
                    };
                    _local_4 = (_arg_1.getNumber("figure_is_typing") > 0);
                    _local_9 = (getAddition(2) as TypingBubble);
                    if (_local_4)
                    {
                        if (!_local_9)
                        {
                            _local_9 = addAddition(new TypingBubble(2, this));
                        };
                        _local_7 = true;
                    }
                    else
                    {
                        if (_local_9)
                        {
                            removeAddition(2);
                        };
                    };
                };
                _local_8 = _arg_1.getNumber("figure_guide_status");
                if (_local_8 != 0)
                {
                    removeAddition(7);
                    addAddition(new GuideStatusBubble(7, this, _local_8));
                    _local_7 = true;
                }
                else
                {
                    if ((getAddition(7) as GuideStatusBubble) != null)
                    {
                        removeAddition(7);
                        _local_7 = true;
                    };
                };
                _local_4 = (_arg_1.getNumber("figure_is_playing_game") > 0);
                _local_9 = (getAddition(5) as GameClickTarget);
                if (_local_4)
                {
                    if (!_local_9)
                    {
                        _local_9 = addAddition(new GameClickTarget(5));
                    };
                    _local_7 = true;
                }
                else
                {
                    if (_local_9)
                    {
                        removeAddition(5);
                    };
                };
                _local_8 = _arg_1.getNumber("figure_number_value");
                _local_9 = (getAddition(4) as NumberBubble);
                if (_local_8 > 0)
                {
                    if (!_local_9)
                    {
                        _local_9 = addAddition(new NumberBubble(4, _local_8, this));
                    };
                    _local_7 = true;
                }
                else
                {
                    if (_local_9)
                    {
                        removeAddition(4);
                    };
                };
                _local_8 = _arg_1.getNumber("figure_expression");
                _local_9 = getAddition(3);
                if (_local_8 > 0)
                {
                    if (!_local_9)
                    {
                        _local_9 = _SafeStr_3380.make(3, _local_8, this);
                        if (_local_9)
                        {
                            addAddition(_local_9);
                        };
                    };
                }
                else
                {
                    if (_local_9)
                    {
                        removeAddition(3);
                    };
                };
                validateActions(_arg_2);
                _local_6 = _arg_1.getString("gender");
                if (_local_6 != _SafeStr_3834)
                {
                    _SafeStr_3834 = _local_6;
                    _local_7 = true;
                };
                _local_5 = _arg_1.getString("figure");
                if (updateFigure(_local_5))
                {
                    _local_7 = true;
                };
                if (_arg_1.hasNumber("figure_sign"))
                {
                    _local_8 = _arg_1.getNumber("figure_sign");
                    if (_local_8 != _SafeStr_4381)
                    {
                        _local_7 = true;
                        _SafeStr_4381 = _local_8;
                    };
                };
                _local_4 = (_arg_1.getNumber("figure_highlight_enable") > 0);
                if (_local_4 != _SafeStr_5344)
                {
                    _SafeStr_5344 = _local_4;
                    _local_7 = true;
                };
                if (_SafeStr_5344)
                {
                    _local_8 = _arg_1.getNumber("figure_highlight");
                    if (_local_8 != _SafeStr_5345)
                    {
                        _SafeStr_5345 = _local_8;
                        _local_7 = true;
                    };
                };
                _local_4 = (_arg_1.getNumber("own_user") > 0);
                if (_local_4 != _SafeStr_5346)
                {
                    _SafeStr_5346 = _local_4;
                    _local_7 = true;
                };
                _SafeStr_4170 = _arg_1.getUpdateID();
                return (_local_7);
            };
            return (false);
        }

        private function updateFigure(_arg_1:String):Boolean
        {
            if (_SafeStr_3819 != _arg_1)
            {
                _SafeStr_3819 = _arg_1;
                resetImages();
                return (true);
            };
            return (false);
        }

        private function resetImages():void
        {
            var _local_2:* = null;
            for each (_local_2 in _avatars)
            {
                if (_local_2)
                {
                    _local_2.dispose();
                };
            };
            for each (_local_2 in _SafeStr_5331)
            {
                if (_local_2)
                {
                    _local_2.dispose();
                };
            };
            _avatars.reset();
            _SafeStr_5331.reset();
            _SafeStr_5333 = null;
            var _local_1:IRoomObjectSprite = getSprite(0);
            if (_local_1 != null)
            {
                _local_1.asset = null;
                _local_1.alpha = 0xFF;
            };
        }

        private function validateActions(_arg_1:Number):void
        {
            var _local_2:int;
            if (_arg_1 < 48)
            {
                _SafeStr_5338 = false;
            };
            if (((_SafeStr_4375 == "sit") || (_SafeStr_4375 == "lay")))
            {
                _geometryOffset = (_arg_1 / 2);
            }
            else
            {
                _geometryOffset = 0;
            };
            _SafeStr_5351 = false;
            _SafeStr_5335 = false;
            if (_SafeStr_4375 == "lay")
            {
                _SafeStr_5335 = true;
                _local_2 = _SafeStr_5339;
                if (_local_2 < 0)
                {
                    _SafeStr_5351 = true;
                };
            };
        }

        private function getAvatarImage(_arg_1:Number, _arg_2:int):_SafeStr_3138
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:String = ("avatarImage" + _arg_1.toString());
            if (_arg_2 == 0)
            {
                _local_4 = (_avatars.getValue(_local_3) as _SafeStr_3138);
            }
            else
            {
                _local_3 = (_local_3 + ("-" + _arg_2));
                _local_4 = (_SafeStr_5331.getValue(_local_3) as _SafeStr_3138);
                if (_local_4)
                {
                    _local_4.forceActionUpdate();
                };
            };
            if (_local_4 == null)
            {
                _local_4 = _SafeStr_5347.getAvatar(_SafeStr_3819, _arg_1, _SafeStr_3834, this, this);
                if (_local_4 != null)
                {
                    if (_arg_2 == 0)
                    {
                        _avatars.add(_local_3, _local_4);
                    }
                    else
                    {
                        if (_SafeStr_5331.length >= 3)
                        {
                            _local_5 = _SafeStr_5331.remove(_SafeStr_5331.getKey(0));
                            if (_local_5)
                            {
                                _local_5.dispose();
                            };
                        };
                        _SafeStr_5331.add(_local_3, _local_4);
                    };
                };
            };
            return (_local_4);
        }

        public function getAvatarRendererAsset(_arg_1:String):IAsset
        {
            return ((_SafeStr_5347) ? _SafeStr_5347.getAvatarRendererAsset(_arg_1) : null);
        }

        private function updateObject(_arg_1:IRoomObject, _arg_2:IRoomGeometry, _arg_3:Boolean, _arg_4:Boolean=false):Boolean
        {
            var _local_6:Boolean;
            var _local_5:int;
            var _local_7:int;
            if ((((_arg_4) || (!(_SafeStr_4174 == _arg_1.getUpdateID()))) || (!(_SafeStr_4072 == _arg_2.updateId))))
            {
                _local_6 = _arg_3;
                _local_5 = (_arg_1.getDirection().x - _arg_2.direction.x);
                _local_5 = (((_local_5 % 360) + 360) % 360);
                if (((_SafeStr_4375 == "sit") && (_SafeStr_5340)))
                {
                    _local_5 = (_local_5 - ((_local_5 % 90) - 45));
                };
                _local_7 = _headAngle;
                if (_SafeStr_4375 == "float")
                {
                    _local_7 = _local_5;
                }
                else
                {
                    _local_7 = (_local_7 - _arg_2.direction.x);
                };
                _local_7 = (((_local_7 % 360) + 360) % 360);
                if (((((_SafeStr_4375 == "sit") && (_SafeStr_5340)) || (_SafeStr_4375 == "swdieback")) || (_SafeStr_4375 == "swdiefront")))
                {
                    _local_7 = (_local_7 - ((_local_7 % 90) - 45));
                };
                if (((!(_local_5 == _SafeStr_5336)) || (_arg_4)))
                {
                    _local_6 = true;
                    _SafeStr_5336 = _local_5;
                    _local_5 = (_local_5 - 112.5);
                    _local_5 = ((_local_5 + 360) % 360);
                    _SafeStr_5333.setDirectionAngle("full", _local_5);
                };
                if (((!(_local_7 == _SafeStr_5348)) || (_arg_4)))
                {
                    _local_6 = true;
                    _SafeStr_5348 = _local_7;
                    if (_SafeStr_5348 != _SafeStr_5336)
                    {
                        _local_7 = (_local_7 - 112.5);
                        _local_7 = ((_local_7 + 360) % 360);
                        _SafeStr_5333.setDirectionAngle("head", _local_7);
                    };
                };
                _SafeStr_4174 = _arg_1.getUpdateID();
                _SafeStr_4072 = _arg_2.updateId;
                return (_local_6);
            };
            return (false);
        }

        private function updateShadow(_arg_1:Number):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_5:IRoomObjectSprite = getSprite(1);
            _shadowAsset = null;
            var _local_4:Boolean = (((_SafeStr_4375 == "mv") || (_SafeStr_4375 == "std")) || ((_SafeStr_4375 == "sit") && (_SafeStr_5340)));
            if (_SafeStr_5341 == 97)
            {
                _local_4 = false;
            };
            if (_local_4)
            {
                _local_5.visible = true;
                if (((_shadowAsset == null) || (!(_arg_1 == _SafeStr_4175))))
                {
                    _local_2 = 0;
                    _local_3 = 0;
                    if (_arg_1 < 48)
                    {
                        _local_5.libraryAssetName = "sh_std_sd_1_0_0";
                        _shadowAsset = _SafeStr_5333.getAsset(_local_5.libraryAssetName);
                        _local_2 = -8;
                        _local_3 = ((_SafeStr_5340) ? 6 : -3);
                    }
                    else
                    {
                        _local_5.libraryAssetName = "h_std_sd_1_0_0";
                        _shadowAsset = _SafeStr_5333.getAsset(_local_5.libraryAssetName);
                        _local_2 = -17;
                        _local_3 = ((_SafeStr_5340) ? 10 : -7);
                    };
                    if (_shadowAsset != null)
                    {
                        _local_5.asset = (_shadowAsset.content as BitmapData);
                        _local_5.offsetX = _local_2;
                        _local_5.offsetY = _local_3;
                        _local_5.alpha = 50;
                        _local_5.relativeDepth = 1;
                    }
                    else
                    {
                        _local_5.visible = false;
                    };
                };
            }
            else
            {
                _shadowAsset = null;
                _local_5.visible = false;
            };
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_5:int;
            var _local_10:* = null;
            var _local_21:* = null;
            var _local_17:* = null;
            var _local_22:Boolean;
            var _local_26:* = null;
            var _local_35:* = null;
            var _local_33:int;
            var _local_27:int;
            var _local_28:* = null;
            var _local_13:int;
            var _local_12:int;
            var _local_15:* = null;
            var _local_41:int;
            var _local_16:int;
            var _local_18:int;
            var _local_20:int;
            var _local_25:int;
            var _local_30:* = null;
            var _local_6:* = null;
            var _local_31:int;
            var _local_8:Boolean;
            var _local_37:int;
            var _local_36:int;
            var _local_38:IRoomObject = object;
            if (_local_38 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_SafeStr_5347 == null)
            {
                return;
            };
            if (_arg_2 < (_lastUpdateTime + 41))
            {
                return;
            };
            _lastUpdateTime = (_lastUpdateTime + 41);
            if ((_lastUpdateTime + 41) < _arg_2)
            {
                _lastUpdateTime = (_arg_2 - 41);
            };
            var _local_23:IRoomObjectModel = _local_38.getModel();
            var _local_11:Number = _arg_1.scale;
            var _local_7:Boolean;
            var _local_19:Boolean;
            var _local_9:Boolean;
            var _local_34:int = _SafeStr_5341;
            var _local_40:Boolean;
            var _local_32:Boolean = updateModel(_local_23, _local_11, _arg_3);
            if (_forceUpdate)
            {
                resetImages();
                _forceUpdate = false;
            };
            if ((((_local_32) || (!(_local_11 == _SafeStr_4175))) || (_SafeStr_5333 == null)))
            {
                if (_local_11 != _SafeStr_4175)
                {
                    _local_19 = true;
                    validateActions(_local_11);
                };
                if (_local_34 != _SafeStr_5341)
                {
                    _local_40 = true;
                };
                if ((((_local_19) || (_SafeStr_5333 == null)) || (_local_40)))
                {
                    _SafeStr_5333 = getAvatarImage(_local_11, _SafeStr_5341);
                    if (_SafeStr_5333 == null)
                    {
                        return;
                    };
                    _local_7 = true;
                    _local_10 = getSprite(0);
                    if ((((_local_10) && (_SafeStr_5333)) && (_SafeStr_5333.isPlaceholder())))
                    {
                        _local_10.alpha = 150;
                    }
                    else
                    {
                        if (_local_10)
                        {
                            _local_10.alpha = 0xFF;
                        };
                    };
                };
                if (_SafeStr_5333 == null)
                {
                    return;
                };
                if (((_local_40) && (_SafeStr_5333.animationHasResetOnToggle)))
                {
                    _SafeStr_5333.resetAnimationFrameCounter();
                };
                updateShadow(_local_11);
                _local_9 = updateObject(_local_38, _arg_1, _arg_3, true);
                updateActions(_SafeStr_5333);
                if (_SafeStr_5332)
                {
                    _local_5 = _SafeStr_5349;
                    for each (var _local_24:IAvatarAddition in _SafeStr_5332)
                    {
                        _local_24.update(getSprite(_local_5++), _local_11);
                    };
                };
                _SafeStr_4175 = _local_11;
            }
            else
            {
                _local_9 = updateObject(_local_38, _arg_1, _arg_3);
            };
            if (_SafeStr_5332)
            {
                _local_5 = _SafeStr_5349;
                for each (_local_24 in _SafeStr_5332)
                {
                    if (_local_24.animate(getSprite(_local_5++)))
                    {
                        increaseUpdateId();
                    };
                };
            };
            var _local_39:Boolean = (((_local_9) || (_local_32)) || (_local_19));
            var _local_29:Boolean = (((_SafeStr_4250) || (_SafeStr_5350 > 0)) && (_arg_3));
            if (_local_39)
            {
                _SafeStr_5350 = 2;
            };
            if (((_local_39) || (_local_29)))
            {
                increaseUpdateId();
                _SafeStr_5350--;
                _updatesUntilFrameUpdate--;
                if (((((_updatesUntilFrameUpdate <= 0) || (_local_19)) || (_local_32)) || (_local_7)))
                {
                    _SafeStr_5333.updateAnimationByFrames(1);
                    _updatesUntilFrameUpdate = 2;
                }
                else
                {
                    return;
                };
                _local_17 = _SafeStr_5333.getCanvasOffsets();
                if (((_local_17 == null) || (_local_17.length < 3)))
                {
                    _local_17 = DEFAULT_CANVAS_OFFSETS;
                };
                _local_21 = getSprite(0);
                if (_local_21 != null)
                {
                    _local_22 = ((_local_23.getNumber("figure_highlight_enable") == 1) && (_local_23.getNumber("figure_highlight") == 1));
                    _local_26 = _SafeStr_5333.getImage("full", _local_22);
                    if (_local_26 != null)
                    {
                        if (_local_22)
                        {
                            _local_35 = new GlowFilter(0xFFFFFF, 1, 6, 6);
                            _local_26.applyFilter(_local_26, _local_26.rect, new Point(0, 0), _local_35);
                        };
                        _local_21.asset = _local_26;
                    };
                    if (_local_21.asset)
                    {
                        _local_21.offsetX = ((((-1 * _local_11) / 2) + _local_17[0]) - ((_local_21.asset.width - _local_11) / 2));
                        _local_21.offsetY = (((-(_local_21.asset.height) + (_local_11 / 4)) + _local_17[1]) + _geometryOffset);
                        if (((_SafeStr_4375 == "swdieback") || (_SafeStr_4375 == "swdiefront")))
                        {
                            _local_21.offsetY = (_local_21.offsetY + ((20 * _local_11) / 32));
                        };
                    };
                    if (_SafeStr_5335)
                    {
                        if (_SafeStr_5351)
                        {
                            _local_21.relativeDepth = -0.5;
                        }
                        else
                        {
                            _local_21.relativeDepth = (-0.409 + _local_17[2]);
                        };
                    }
                    else
                    {
                        _local_21.relativeDepth = (-0.01 + _local_17[2]);
                    };
                    if (_SafeStr_5346)
                    {
                        _local_21.relativeDepth = (_local_21.relativeDepth - 0.001);
                        _local_21.spriteType = RoomObjectSpriteType._SafeStr_5352;
                    }
                    else
                    {
                        _local_21.spriteType = RoomObjectSpriteType.AVATAR;
                    };
                };
                _local_24 = (getAddition(2) as TypingBubble);
                if (_local_24)
                {
                    if (!_SafeStr_5335)
                    {
                        TypingBubble(_local_24).relativeDepth = ((-0.01 - 0.01) + _local_17[2]);
                    }
                    else
                    {
                        TypingBubble(_local_24).relativeDepth = ((-0.409 - 0.01) + _local_17[2]);
                    };
                };
                _SafeStr_4250 = _SafeStr_5333.isAnimating();
                _local_33 = 2;
                _local_27 = _SafeStr_5333.getDirection();
                for each (var _local_14:ISpriteDataContainer in _SafeStr_5333.getSprites())
                {
                    if (_local_14.id == "avatar")
                    {
                        _local_21 = getSprite(0);
                        _local_28 = _SafeStr_5333.getLayerData(_local_14);
                        _local_13 = _local_14.getDirectionOffsetX(_local_27);
                        _local_12 = _local_14.getDirectionOffsetY(_local_27);
                        if (_local_28 != null)
                        {
                            _local_13 = (_local_13 + _local_28.dx);
                            _local_12 = (_local_12 + _local_28.dy);
                        };
                        if (_local_11 < 48)
                        {
                            _local_13 = int((_local_13 / 2));
                            _local_12 = int((_local_12 / 2));
                        };
                        if (!_SafeStr_5340)
                        {
                            _local_21.offsetX = (_local_21.offsetX + _local_13);
                            _local_21.offsetY = (_local_21.offsetY + _local_12);
                        };
                    }
                    else
                    {
                        _local_21 = getSprite(_local_33);
                        if (_local_21 != null)
                        {
                            _local_21.alphaTolerance = 0x0100;
                            _local_21.visible = true;
                            _local_15 = _SafeStr_5333.getLayerData(_local_14);
                            _local_41 = 0;
                            _local_16 = _local_14.getDirectionOffsetX(_local_27);
                            _local_18 = _local_14.getDirectionOffsetY(_local_27);
                            _local_20 = _local_14.getDirectionOffsetZ(_local_27);
                            _local_25 = 0;
                            if (_local_14.hasDirections)
                            {
                                _local_25 = _local_27;
                            };
                            if (_local_15 != null)
                            {
                                _local_41 = _local_15.animationFrame;
                                _local_16 = (_local_16 + _local_15.dx);
                                _local_18 = (_local_18 + _local_15.dy);
                                _local_25 = (_local_25 + _local_15.directionOffset);
                            };
                            if (_local_11 < 48)
                            {
                                _local_16 = int((_local_16 / 2));
                                _local_18 = int((_local_18 / 2));
                            };
                            if (_local_25 < 0)
                            {
                                _local_25 = (_local_25 + 8);
                            }
                            else
                            {
                                if (_local_25 > 7)
                                {
                                    _local_25 = (_local_25 - 8);
                                };
                            };
                            _local_30 = ((((((_SafeStr_5333.getScale() + "_") + _local_14.member) + "_") + _local_25) + "_") + _local_41);
                            _local_6 = _SafeStr_5333.getAsset(_local_30);
                            _local_31 = ((_SafeStr_5333.getScale() == "sh") ? 32 : 64);
                            _local_8 = false;
                            if (_local_6 == null)
                            {
                                if (_SafeStr_5333.getScale() == "sh")
                                {
                                    _local_30 = ((((("h_" + _local_14.member) + "_") + _local_25) + "_") + _local_41);
                                    _local_6 = _SafeStr_5333.getAsset(_local_30);
                                    _local_8 = true;
                                };
                                if (_local_6 == null) continue;
                            };
                            _local_21.asset = ((_local_8) ? _SafeStr_3291.resampleBitmapData((_local_6.content as BitmapData), 0.5) : (_local_6.content as BitmapData));
                            _local_37 = int(((_local_8) ? (_local_6.offset.x / 2) : _local_6.offset.x));
                            _local_36 = int(((_local_8) ? (_local_6.offset.y / 2) : _local_6.offset.y));
                            _local_21.offsetX = ((-(_local_37) - (_local_31 / 2)) + _local_16);
                            _local_21.offsetY = (-(_local_36) + _local_18);
                            if (_local_14.hasStaticY)
                            {
                                _local_21.offsetY = (_local_21.offsetY + ((_SafeStr_5334 * _local_11) / (2 * 1000)));
                            }
                            else
                            {
                                _local_21.offsetY = (_local_21.offsetY + _geometryOffset);
                            };
                            if (_SafeStr_5335)
                            {
                                _local_21.relativeDepth = (-0.409 - ((0.001 * spriteCount) * _local_20));
                            }
                            else
                            {
                                _local_21.relativeDepth = (-0.01 - ((0.001 * spriteCount) * _local_20));
                            };
                            if (_local_14.ink == 33)
                            {
                                _local_21.blendMode = "add";
                            }
                            else
                            {
                                _local_21.blendMode = "normal";
                            };
                        };
                        _local_33++;
                    };
                };
            };
        }

        private function updateActions(_arg_1:_SafeStr_3138):void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.initActionAppends();
            _arg_1.appendAction("posture", _SafeStr_4375, _SafeStr_5339);
            if (_SafeStr_4376 > 0)
            {
                _arg_1.appendAction("gest", AvatarAction.getGesture(_SafeStr_4376));
            };
            if (_SafeStr_4126 > 0)
            {
                _arg_1.appendAction("dance", _SafeStr_4126);
            };
            if (_SafeStr_4381 > -1)
            {
                _arg_1.appendAction("sign", _SafeStr_4381);
            };
            if (_SafeStr_5342 > 0)
            {
                _arg_1.appendAction("cri", _SafeStr_5342);
            };
            if (_SafeStr_5343 > 0)
            {
                _arg_1.appendAction("usei", _SafeStr_5343);
            };
            if (_SafeStr_5337)
            {
                _arg_1.appendAction("talk");
            };
            if (((_SafeStr_4876) || (_SafeStr_5338)))
            {
                _arg_1.appendAction("Sleep");
            };
            if (_SafeStr_4790 > 0)
            {
                _local_3 = AvatarAction.getExpression(_SafeStr_4790);
                if (_local_3 != "")
                {
                    switch (_local_3)
                    {
                        case "dance":
                            _arg_1.appendAction("dance", 2);
                            break;
                        default:
                            _arg_1.appendAction(_local_3);
                    };
                };
            };
            if (_SafeStr_5341 > 0)
            {
                _arg_1.appendAction("fx", _SafeStr_5341);
            };
            _arg_1.endActionAppends();
            _SafeStr_4250 = _arg_1.isAnimating();
            var _local_2:int = 2;
            for each (var _local_4:ISpriteDataContainer in _SafeStr_5333.getSprites())
            {
                if (_local_4.id != "avatar")
                {
                    _local_2++;
                };
            };
            if (_local_2 != spriteCount)
            {
                createSprites(_local_2);
            };
            _SafeStr_5349 = _local_2;
            if (_SafeStr_5332)
            {
                for each (var _local_6:IAvatarAddition in _SafeStr_5332)
                {
                    _local_5 = addSprite();
                };
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            _forceUpdate = true;
        }

        public function avatarEffectReady(_arg_1:int):void
        {
            _forceUpdate = true;
        }

        protected function get numAdditions():int
        {
            return ((_SafeStr_5332) ? _SafeStr_5332.length : 0);
        }

        public function addAddition(_arg_1:IAvatarAddition):IAvatarAddition
        {
            if (!_SafeStr_5332)
            {
                _SafeStr_5332 = new _SafeStr_24();
            };
            if (_SafeStr_5332.hasKey(_arg_1.id))
            {
                throw (new Error((("Avatar addition with index " + _arg_1.id) + "already exists!")));
            };
            _SafeStr_5332.add(_arg_1.id, _arg_1);
            return (_arg_1);
        }

        public function getAddition(_arg_1:int):IAvatarAddition
        {
            return ((_SafeStr_5332) ? _SafeStr_5332[_arg_1] : null);
        }

        public function removeAddition(_arg_1:int):void
        {
            var _local_2:IAvatarAddition = getAddition(_arg_1);
            if (!_local_2)
            {
                return;
            };
            _SafeStr_5332.remove(_arg_1);
            _local_2.dispose();
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)
// _SafeStr_3274 = "_-z6" (String#5709, DoABC#4)
// _SafeStr_3291 = "_-lX" (String#10764, DoABC#4)
// _SafeStr_3323 = "_-o1w" (String#8055, DoABC#4)
// _SafeStr_3380 = "_-mT" (String#18186, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4072 = "_-Ds" (String#2730, DoABC#4)
// _SafeStr_4126 = "_-32L" (String#5358, DoABC#4)
// _SafeStr_4170 = "_-t1V" (String#3658, DoABC#4)
// _SafeStr_4174 = "_-TP" (String#7891, DoABC#4)
// _SafeStr_4175 = "_-W1q" (String#3259, DoABC#4)
// _SafeStr_4250 = "_-e1P" (String#3450, DoABC#4)
// _SafeStr_4375 = "_-Q2" (String#2723, DoABC#4)
// _SafeStr_4376 = "_-410" (String#4262, DoABC#4)
// _SafeStr_4381 = "_-q11" (String#7236, DoABC#4)
// _SafeStr_4790 = "_-52" (String#7226, DoABC#4)
// _SafeStr_4876 = "_-D1O" (String#5749, DoABC#4)
// _SafeStr_5331 = "_-aP" (String#6907, DoABC#4)
// _SafeStr_5332 = "_-P8" (String#3652, DoABC#4)
// _SafeStr_5333 = "_-NT" (String#2225, DoABC#4)
// _SafeStr_5334 = "_-N1e" (String#7790, DoABC#4)
// _SafeStr_5335 = "_-Ho" (String#8365, DoABC#4)
// _SafeStr_5336 = "_-9m" (String#13445, DoABC#4)
// _SafeStr_5337 = "_-9r" (String#15472, DoABC#4)
// _SafeStr_5338 = "_-v1f" (String#11285, DoABC#4)
// _SafeStr_5339 = "_-X1d" (String#11822, DoABC#4)
// _SafeStr_5340 = "_-2H" (String#7246, DoABC#4)
// _SafeStr_5341 = "_-RW" (String#5292, DoABC#4)
// _SafeStr_5342 = "_-R1c" (String#8104, DoABC#4)
// _SafeStr_5343 = "_-nt" (String#6099, DoABC#4)
// _SafeStr_5344 = "_-22h" (String#15758, DoABC#4)
// _SafeStr_5345 = "_-y17" (String#20002, DoABC#4)
// _SafeStr_5346 = "_-C1G" (String#14207, DoABC#4)
// _SafeStr_5347 = "_-J1Q" (String#8274, DoABC#4)
// _SafeStr_5348 = "_-B1q" (String#15023, DoABC#4)
// _SafeStr_5349 = "_-w1y" (String#15729, DoABC#4)
// _SafeStr_5350 = "_-D17" (String#10499, DoABC#4)
// _SafeStr_5351 = "_-I1U" (String#12844, DoABC#4)
// _SafeStr_5352 = "_-Bk" (String#22465, DoABC#4)
// _SafeStr_8746 = "_-qQ" (String#32245, DoABC#4)
// _SafeStr_8747 = "_-8V" (String#30697, DoABC#4)


