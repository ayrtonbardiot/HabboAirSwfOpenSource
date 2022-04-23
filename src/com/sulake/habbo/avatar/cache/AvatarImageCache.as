// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.cache.AvatarImageCache

package com.sulake.habbo.avatar.cache
{
    import com.sulake.habbo.utils.StringBuffer;
    import com.sulake.habbo.avatar.AvatarStructure;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.utils.getTimer;
    import com.sulake.habbo.avatar.actions._SafeStr_3292;
    import flash.geom.Point;
    import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
    import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
    import com.sulake.habbo.avatar.AvatarImagePartContainer;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.habbo.utils._SafeStr_3291;
    import __AS3__.vec.Vector;
    import flash.geom.Rectangle;

    public class AvatarImageCache 
    {

        private static const DEFAULT_MAX_CACHE_STORAGE_TIME_MS:int = 60000;
        private static const _SafeStr_8263:String = "_";
        private static const DEF_SEPARATOR:String = ".";
        private static const BASE_ACTION:String = "std";
        private static const PART_FACE:String = "fc";
        private static const PART_EYES:String = "ey";
        private static const PART_RIGHT_ITEM:String = "ri";
        private static const ACTION_WAVE:String = "wav";
        private static const ACTION_DRINK:String = "drk";
        private static const ACTION_BLOW:String = "blw";
        private static const ACTION_SIGN:String = "sig";
        private static const ACTION_RESPECT:String = "respect";

        private static var _SafeStr_4167:StringBuffer;
        private static var _partNameArray:Array;
        private static var _SafeStr_5951:Array;

        private var _SafeStr_3762:AvatarStructure;
        private var _SafeStr_5586:_SafeStr_3138;
        private var _assets:AssetAliasCollection;
        private var _SafeStr_4045:String;
        private var _cache:_SafeStr_24;
        private var _SafeStr_5234:AvatarCanvas;
        private var _disposed:Boolean;
        private var _SafeStr_5952:String;
        private var _SafeStr_5955:Array = [];
        private var _SafeStr_5882:ColorTransform = new ColorTransform();
        private var _SafeStr_5956:Matrix = new Matrix();
        private var _SafeStr_5953:Array = [];
        private var _SafeStr_5954:Boolean = false;

        public function AvatarImageCache(_arg_1:AvatarStructure, _arg_2:_SafeStr_3138, _arg_3:AssetAliasCollection, _arg_4:String, _arg_5:Boolean)
        {
            var _local_6:int;
            super();
            _SafeStr_3762 = _arg_1;
            _SafeStr_5586 = _arg_2;
            _assets = _arg_3;
            _SafeStr_4045 = _arg_4;
            _cache = new _SafeStr_24();
            _SafeStr_5954 = _arg_5;
            if (!_SafeStr_4167)
            {
                _SafeStr_4167 = new StringBuffer();
            };
            if (!_partNameArray)
            {
                _partNameArray = [null, "_", null, "_", null, "_", null, "_", null, "_", null];
            };
            if (!_SafeStr_5951)
            {
                _SafeStr_5951 = [];
                _local_6 = 0;
                while (_local_6 < 10000)
                {
                    _SafeStr_5951.push(_local_6.toString());
                    _local_6++;
                };
            };
        }

        private static function convertColorToHex(_arg_1:Number):String
        {
            var _local_2:String = (_arg_1 * 0xFF).toString(16);
            if (_local_2.length < 2)
            {
                _local_2 = ("0" + _local_2);
            };
            return (_local_2);
        }


        public function dispose():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_3:* = null;
            if (_disposed)
            {
                return;
            };
            _SafeStr_3762 = null;
            _SafeStr_5586 = null;
            _assets = null;
            if (_cache != null)
            {
                _local_1 = _cache.getKeys();
                for each (_local_3 in _local_1)
                {
                    _local_2 = (_cache.getValue(_local_3) as AvatarImageBodyPartCache);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                };
                _cache.dispose();
                _cache = null;
            };
            _SafeStr_5234 = null;
            _disposed = true;
        }

        public function disposeInactiveActions(_arg_1:int=60000):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:int = getTimer();
            var _local_2:Array = _cache.getKeys();
            for each (_local_5 in _local_2)
            {
                _local_4 = (_cache.getValue(_local_5) as AvatarImageBodyPartCache);
                if (_local_4 != null)
                {
                    _local_4.disposeActions(_arg_1, _local_3);
                };
            };
        }

        public function resetBodyPartCache(_arg_1:_SafeStr_3292):void
        {
            var _local_2:* = null;
            for each (_local_2 in _cache)
            {
                if (_local_2 != null)
                {
                    _local_2.setAction(_arg_1, 0);
                };
            };
        }

        public function setDirection(_arg_1:String, _arg_2:int):void
        {
            var _local_5:* = null;
            var _local_3:Array = _SafeStr_3762.getBodyPartsUnordered(_arg_1);
            for each (var _local_4:String in _local_3)
            {
                _local_5 = getBodyPartCache(_local_4);
                if (_local_5 != null)
                {
                    _local_5.setDirection(_arg_2);
                };
            };
        }

        public function setAction(_arg_1:_SafeStr_3292, _arg_2:int):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:Array = _SafeStr_3762.getActiveBodyPartIds(_arg_1, _SafeStr_5586);
            for each (_local_4 in _local_3)
            {
                _local_5 = getBodyPartCache(_local_4);
                if (_local_5 != null)
                {
                    _local_5.setAction(_arg_1, _arg_2);
                };
            };
        }

        public function setGeometryType(_arg_1:String):void
        {
            if (_SafeStr_5952 == _arg_1)
            {
                return;
            };
            if (((((_SafeStr_5952 == "sitting") && (_arg_1 == "vertical")) || ((_SafeStr_5952 == "vertical") && (_arg_1 == "sitting"))) || ((_SafeStr_5952 == "swhorizontal") || (_arg_1 == "swhorizontal"))))
            {
                _SafeStr_5952 = _arg_1;
                _SafeStr_5234 = null;
                return;
            };
            disposeInactiveActions(0);
            _SafeStr_5952 = _arg_1;
            _SafeStr_5234 = null;
        }

        public function getImageContainer(_arg_1:String, _arg_2:int, _arg_3:Boolean=false):AvatarImageBodyPartContainer
        {
            var _local_7:int;
            var _local_14:* = null;
            var _local_17:int;
            var _local_13:* = null;
            var _local_20:*;
            var _local_18:*;
            var _local_10:AvatarImageBodyPartCache = getBodyPartCache(_arg_1);
            if (_local_10 == null)
            {
                _local_10 = new AvatarImageBodyPartCache();
                _cache.add(_arg_1, _local_10);
            };
            var _local_11:int = _local_10.getDirection();
            var _local_9:* = _arg_2;
            var _local_15:_SafeStr_3292 = _local_10.getAction();
            if (_local_15.definition.startFromFrameZero)
            {
                _local_9 = (_local_9 - _local_15.startFrame);
            };
            var _local_8:* = _local_15;
            var _local_4:Array = [];
            var _local_16:_SafeStr_24 = new _SafeStr_24();
            var _local_12:Point = new Point();
            if (!((!(_local_15)) || (!(_local_15.definition))))
            {
                if (_local_15.definition.isAnimation)
                {
                    _local_7 = _local_11;
                    _local_14 = _SafeStr_3762.getAnimation(((_local_15.definition.state + ".") + _local_15.actionParameter));
                    _local_17 = (_arg_2 - _local_15.startFrame);
                    if (_local_14 != null)
                    {
                        _local_13 = _local_14.getLayerData(_local_17, _arg_1, _local_15.overridingAction);
                        if (_local_13 != null)
                        {
                            _local_7 = (_local_11 + _local_13.directionOffset);
                            if (_local_13.directionOffset < 0)
                            {
                                if (_local_7 < 0)
                                {
                                    _local_7 = (8 + _local_7);
                                }
                                else
                                {
                                    if (_local_7 > 7)
                                    {
                                        _local_7 = (8 - _local_7);
                                    };
                                };
                            }
                            else
                            {
                                if (_local_7 < 0)
                                {
                                    _local_7 = (_local_7 + 8);
                                }
                                else
                                {
                                    if (_local_7 > 7)
                                    {
                                        _local_7 = (_local_7 - 8);
                                    };
                                };
                            };
                            if (_SafeStr_4045 == "h")
                            {
                                _local_12.x = _local_13.dx;
                                _local_12.y = _local_13.dy;
                            }
                            else
                            {
                                _local_12.x = (_local_13.dx / 2);
                                _local_12.y = (_local_13.dy / 2);
                            };
                            _local_9 = _local_13.animationFrame;
                            if (_local_13.action != null)
                            {
                                _local_15 = _local_13.action;
                            };
                            if (_local_13.type == "bodypart")
                            {
                                if (_local_13.action != null)
                                {
                                    _local_8 = _local_13.action;
                                };
                                _local_11 = _local_7;
                            }
                            else
                            {
                                if (_local_13.type == "fx")
                                {
                                    _local_11 = _local_7;
                                };
                            };
                            _local_16 = _local_13.items;
                        };
                        _local_4 = _local_14.removeData;
                    };
                };
            };
            var _local_19:AvatarImageActionCache = _local_10.getActionCache(_local_8);
            if (((_local_19 == null) || (_arg_3)))
            {
                _local_19 = new AvatarImageActionCache();
                _local_10.updateActionCache(_local_8, _local_19);
            };
            var _local_5:AvatarImageDirectionCache = _local_19.getDirectionCache(_local_11);
            if (((_local_5 == null) || (_arg_3)))
            {
                _local_20 = _SafeStr_3762.getParts(_arg_1, _SafeStr_5586.getFigure(), _local_8, _SafeStr_5952, _local_11, _local_4, _SafeStr_5586, _local_16);
                if (!_local_20)
                {
                    return (null);
                };
                _local_5 = new AvatarImageDirectionCache(_local_20);
                _local_19.updateDirectionCache(_local_11, _local_5);
            };
            var _local_6:AvatarImageBodyPartContainer = _local_5.getImageContainer(_local_9);
            if (((_local_6 == null) || (_arg_3)))
            {
                _local_18 = _local_5.getPartList();
                _local_6 = renderBodyPart(_local_11, _local_18, _local_9, _local_15, _arg_3);
                if (((!(_local_6 == null)) && (!(_arg_3))))
                {
                    if (_local_6.isCacheable)
                    {
                        _local_5.updateImageContainer(_local_6, _local_9);
                    };
                }
                else
                {
                    return (null);
                };
            };
            _local_6.offset = _local_12.add(_SafeStr_3762.getFrameBodyPartOffset(_local_8, _local_11, _local_9, _arg_1));
            return (_local_6);
        }

        public function getServerRenderData():Array
        {
            var _local_1:Array = _SafeStr_5953;
            _SafeStr_5953 = [];
            return (_local_1);
        }

        public function getBodyPartCache(_arg_1:String):AvatarImageBodyPartCache
        {
            var _local_2:AvatarImageBodyPartCache = (_cache.getValue(_arg_1) as AvatarImageBodyPartCache);
            if (_local_2 == null)
            {
                _local_2 = new AvatarImageBodyPartCache();
                _cache.add(_arg_1, _local_2);
            };
            return (_local_2);
        }

        private function renderBodyPart(_arg_1:int, _arg_2:Vector.<AvatarImagePartContainer>, _arg_3:int, _arg_4:_SafeStr_3292, _arg_5:Boolean=false):AvatarImageBodyPartContainer
        {
            var _local_12:Boolean;
            var _local_24:int;
            var _local_8:* = null;
            var _local_18:* = null;
            var _local_6:* = null;
            var _local_15:* = null;
            var _local_26:int;
            var _local_10:* = null;
            var _local_30:* = null;
            var _local_29:* = null;
            var _local_21:Boolean;
            var _local_17:* = null;
            var _local_19:* = null;
            var _local_11:* = null;
            var _local_27:* = null;
            var _local_9:* = null;
            if (_arg_2 == null)
            {
                return (null);
            };
            if (_arg_2.length == 0)
            {
                return (null);
            };
            if (!_SafeStr_5234)
            {
                _SafeStr_5234 = _SafeStr_3762.getCanvas(_SafeStr_4045, _SafeStr_5952);
                if (!_SafeStr_5234)
                {
                    return (null);
                };
            };
            var _local_23:* = _arg_1;
            var _local_25:Boolean = AvatarDirectionAngle._SafeStr_5583[_arg_1];
            var _local_31:String = _arg_4.definition.assetPartDefinition;
            var _local_13:Boolean = true;
            var _local_20:int = (_arg_2.length - 1);
            _local_24 = _local_20;
            while (_local_24 >= 0)
            {
                _local_8 = (_arg_2[_local_24] as AvatarImagePartContainer);
                if (!((_arg_1 == 7) && ((_local_8.partType == "fc") || (_local_8.partType == "ey"))))
                {
                    if (!((_local_8.partType == "ri") && (_local_8.partId == null)))
                    {
                        _local_18 = _local_8.partType;
                        _local_6 = _local_8.partId;
                        _local_15 = _local_8.getFrameDefinition(_arg_3);
                        if (_local_15)
                        {
                            _local_26 = _local_15.number;
                            if (((_local_15.assetPartDefinition) && (_local_15.assetPartDefinition.length > 0)))
                            {
                                _local_31 = _local_15.assetPartDefinition;
                            };
                        }
                        else
                        {
                            _local_26 = _local_8.getFrameIndex(_arg_3);
                        };
                        _local_23 = _arg_1;
                        _local_12 = false;
                        if (_local_25)
                        {
                            if (((_local_31 == "wav") && (((_local_18 == "lh") || (_local_18 == "ls")) || (_local_18 == "lc"))))
                            {
                                _local_12 = true;
                            }
                            else
                            {
                                if (((_local_31 == "drk") && (((_local_18 == "rh") || (_local_18 == "rs")) || (_local_18 == "rc"))))
                                {
                                    _local_12 = true;
                                }
                                else
                                {
                                    if (((_local_31 == "blw") && (_local_18 == "rh")))
                                    {
                                        _local_12 = true;
                                    }
                                    else
                                    {
                                        if (((_local_31 == "sig") && (_local_18 == "lh")))
                                        {
                                            _local_12 = true;
                                        }
                                        else
                                        {
                                            if (((_local_31 == "respect") && (_local_18 == "lh")))
                                            {
                                                _local_12 = true;
                                            }
                                            else
                                            {
                                                if (_local_18 == "ri")
                                                {
                                                    _local_12 = true;
                                                }
                                                else
                                                {
                                                    if (_local_18 == "li")
                                                    {
                                                        _local_12 = true;
                                                    }
                                                    else
                                                    {
                                                        if (_local_18 == "cp")
                                                        {
                                                            _local_12 = true;
                                                        }
                                                        else
                                                        {
                                                            if (_arg_1 == 4)
                                                            {
                                                                _local_23 = 2;
                                                            }
                                                            else
                                                            {
                                                                if (_arg_1 == 5)
                                                                {
                                                                    _local_23 = 1;
                                                                }
                                                                else
                                                                {
                                                                    if (_arg_1 == 6)
                                                                    {
                                                                        _local_23 = 0;
                                                                    };
                                                                };
                                                            };
                                                            if (_local_8.flippedPartType != _local_18)
                                                            {
                                                                _local_18 = _local_8.flippedPartType;
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        _SafeStr_4167.length = 0;
                        _partNameArray[0] = ((_SafeStr_5954) ? "h" : _SafeStr_4045);
                        _partNameArray[2] = _local_31;
                        _partNameArray[4] = _local_18;
                        _partNameArray[6] = _local_6;
                        _partNameArray[8] = _SafeStr_5951[_local_23];
                        _partNameArray[10] = _SafeStr_5951[_local_26];
                        _SafeStr_4167.appendStringArray(_partNameArray);
                        _local_10 = _SafeStr_4167.toString();
                        _local_30 = (_assets.getAssetByName(_local_10) as BitmapDataAsset);
                        if (_local_30 == null)
                        {
                            _SafeStr_4167.length = 0;
                            _partNameArray[2] = "std";
                            _partNameArray[10] = _SafeStr_5951[0];
                            _SafeStr_4167.appendStringArray(_partNameArray);
                            _local_10 = _SafeStr_4167.toString();
                            _local_30 = (_assets.getAssetByName(_local_10) as BitmapDataAsset);
                        };
                        if (_local_30)
                        {
                            _local_29 = (_local_30.content as BitmapData);
                            if (_local_29 == null)
                            {
                                _local_13 = false;
                            }
                            else
                            {
                                _local_21 = false;
                                if (((_local_8.isColorable) && (!(_local_8.color == null))))
                                {
                                    _local_17 = _local_8.color.colorTransform;
                                    _SafeStr_5882.redMultiplier = _local_17.redMultiplier;
                                    _SafeStr_5882.greenMultiplier = _local_17.greenMultiplier;
                                    _SafeStr_5882.blueMultiplier = _local_17.blueMultiplier;
                                    _SafeStr_5882.alphaMultiplier = _local_17.alphaMultiplier;
                                    _local_21 = true;
                                }
                                else
                                {
                                    var _local_32:* = 1;
                                    _SafeStr_5882.alphaMultiplier = _local_32;
                                    _SafeStr_5882.blueMultiplier = _local_32;
                                    _SafeStr_5882.greenMultiplier = _local_32;
                                    _SafeStr_5882.redMultiplier = _local_32;
                                };
                                if (_local_8.isBlendable)
                                {
                                    _SafeStr_5882.concat(_local_8.blendTransform);
                                    _local_21 = true;
                                };
                                _local_19 = _local_30.offset.clone();
                                if (_local_12)
                                {
                                    _local_19.x = (_local_19.x + ((_SafeStr_4045 == "h") ? 65 : 31));
                                };
                                _local_11 = null;
                                if (_local_21)
                                {
                                    _local_11 = new ColorTransform();
                                    _local_11.concat(_SafeStr_5882);
                                };
                                if (_arg_5)
                                {
                                    _local_27 = new RoomObjectSpriteData();
                                    _local_27.name = _assets.getAssetName(_local_10);
                                    _local_27.x = (-(_local_19.x) - 33);
                                    _local_27.y = -(_local_19.y);
                                    _local_27.z = (_SafeStr_5953.length * -0.0001);
                                    _local_27.width = _local_30.rectangle.width;
                                    _local_27.height = _local_30.rectangle.height;
                                    _local_27.flipH = _local_12;
                                    if (_local_31 == "lay")
                                    {
                                        _local_27.x = (_local_27.x + 53);
                                    };
                                    if (_local_25)
                                    {
                                        _local_27.flipH = (!(_local_27.flipH));
                                        if (_local_27.flipH)
                                        {
                                            _local_27.x = (-(_local_27.x) - _local_29.width);
                                        }
                                        else
                                        {
                                            _local_27.x = (_local_27.x + 65);
                                        };
                                    };
                                    if (((_local_8.isColorable) && (_local_11)))
                                    {
                                        _local_27.color = ((("0x" + convertColorToHex(_local_11.redMultiplier)) + convertColorToHex(_local_11.greenMultiplier)) + convertColorToHex(_local_11.blueMultiplier));
                                    };
                                    _SafeStr_5953.push(_local_27);
                                };
                                _SafeStr_5955.push(new ImageData(_local_29, _local_30.rectangle, _local_19, _local_12, _local_11));
                            };
                        };
                    };
                };
                _local_24--;
            };
            if (_SafeStr_5955.length == 0)
            {
                return (null);
            };
            var _local_16:ImageData = createUnionImage(_SafeStr_5955, _local_25);
            var _local_14:int = ((_SafeStr_4045 == "h") ? (_SafeStr_5234.height - 16) : (_SafeStr_5234.height - 8));
            var _local_22:Point = _local_16.regPoint;
            if (_SafeStr_5954)
            {
                _local_22 = new Point((_local_22.x / 2), (_local_22.y / 2));
            };
            var _local_7:Point = new Point(-(_local_22.x), (_local_14 - _local_22.y));
            if (((_local_25) && (!(_local_31 == "lay"))))
            {
                _local_7.x = (_local_7.x + ((_SafeStr_4045 == "h") ? 67 : 31));
            };
            _local_24 = (_SafeStr_5955.length - 1);
            while (_local_24 >= 0)
            {
                _local_9 = _SafeStr_5955.pop();
                if (_local_9)
                {
                    _local_9.dispose();
                };
                _local_24--;
            };
            var _local_28:BitmapData = _local_16.bitmap;
            if (_SafeStr_5954)
            {
                _local_28 = _SafeStr_3291.resampleBitmapData(_local_28, 0.5);
            };
            return (new AvatarImageBodyPartContainer(_local_28, _local_7, _local_13));
        }

        private function createUnionImage(_arg_1:Array, _arg_2:Boolean):ImageData
        {
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_8:Boolean;
            var _local_3:* = null;
            _local_3 = new Rectangle();
            for each (_local_4 in _arg_1)
            {
                _local_3 = _local_3.union(_local_4.offsetRect);
            };
            _local_5 = new Point(-(_local_3.left), -(_local_3.top));
            _local_6 = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            for each (_local_4 in _arg_1)
            {
                _local_7 = _local_5.subtract(_local_4.regPoint);
                if (_arg_2)
                {
                    _local_7.x = (_local_6.width - (_local_7.x + _local_4.rect.width));
                };
                _local_8 = ((!((_arg_2) && (_local_4.flipH))) && ((_arg_2) || (_local_4.flipH)));
                if (_local_8)
                {
                    _SafeStr_5956.a = -1;
                    _SafeStr_5956.tx = ((_local_4.rect.x + _local_4.rect.width) + _local_7.x);
                    _SafeStr_5956.ty = (_local_7.y - _local_4.rect.y);
                    _local_3.x = _local_7.x;
                    _local_3.y = _local_7.y;
                    _local_3.width = _local_4.rect.width;
                    _local_3.height = _local_4.rect.height;
                    _local_6.draw(_local_4.bitmap, _SafeStr_5956, _local_4.colorTransform, null, _local_3);
                }
                else
                {
                    if (_local_4.colorTransform)
                    {
                        _SafeStr_5956.a = 1;
                        _SafeStr_5956.tx = (_local_7.x - _local_4.rect.x);
                        _SafeStr_5956.ty = (_local_7.y - _local_4.rect.y);
                        _local_3.x = _local_7.x;
                        _local_3.y = _local_7.y;
                        _local_3.width = _local_4.rect.width;
                        _local_3.height = _local_4.rect.height;
                        _local_6.draw(_local_4.bitmap, _SafeStr_5956, _local_4.colorTransform, null, _local_3);
                    }
                    else
                    {
                        _local_6.copyPixels(_local_4.bitmap, _local_4.rect, _local_7, null, null, true);
                    };
                };
            };
            return (new ImageData(_local_6, _local_6.rect, _local_5, _arg_2, null));
        }

        private function drawBorders(_arg_1:BitmapData, _arg_2:Rectangle, _arg_3:uint):void
        {
            var _local_4:int;
            var _local_5:int = (_arg_2.bottom - 1);
            _local_4 = _arg_2.left;
            while (_local_4 < (_arg_2.right - 1))
            {
                _arg_1.setPixel32(_local_4, 0, _arg_3);
                _arg_1.setPixel32(_local_4, _local_5, _arg_3);
                _local_4++;
            };
            _local_5 = _arg_2.top;
            while (_local_5 < (_arg_2.bottom - 1))
            {
                _arg_1.setPixel32(0, _local_5, _arg_3);
                _arg_1.setPixel32(_local_4, _local_5, _arg_3);
                _local_5++;
            };
        }

        private function debugInfo(_arg_1:String):void
        {
            _SafeStr_14.log(("[AvatarImageCache] " + _arg_1));
        }


    }
}//package com.sulake.habbo.avatar.cache

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3291 = "_-lX" (String#10764, DoABC#4)
// _SafeStr_3292 = "_-91r" (String#2734, DoABC#4)
// _SafeStr_3762 = "_-Q11" (String#1051, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_4167 = "_-q1j" (String#4478, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_5583 = "_-WZ" (String#19304, DoABC#4)
// _SafeStr_5586 = "_-d1n" (String#1081, DoABC#4)
// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)
// _SafeStr_5951 = "_-u1l" (String#10174, DoABC#4)
// _SafeStr_5952 = "_-gc" (String#5149, DoABC#4)
// _SafeStr_5953 = "_-o1U" (String#9905, DoABC#4)
// _SafeStr_5954 = "_-I1h" (String#12987, DoABC#4)
// _SafeStr_5955 = "_-Yp" (String#10248, DoABC#4)
// _SafeStr_5956 = "_-Q1J" (String#1484, DoABC#4)
// _SafeStr_8263 = "_-HX" (String#30554, DoABC#4)


