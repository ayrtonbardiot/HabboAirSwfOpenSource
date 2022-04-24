// by nota

//com.sulake.habbo.room.object.visualization.room.RoomVisualization

package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IPlaneVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.visualization.IRoomPlane;

    public class RoomVisualization extends RoomObjectSpriteVisualization implements IPlaneVisualization 
    {

        public static const _SafeStr_8765:int = 0xFFFFFF;
        public static const _SafeStr_8766:int = 0xDDDDDD;
        public static const FLOOR_COLOR_RIGHT:int = 0xBBBBBB;
        private static const _SafeStr_8767:int = 0xFFFFFF;
        private static const WALL_COLOR_SIDE:int = 0xCCCCCC;
        private static const WALL_COLOR_BOTTOM:int = 0x999999;
        private static const WALL_COLOR_BORDER:int = 0x999999;
        public static const LANDSCAPE_COLOR_TOP:int = 0xFFFFFF;
        public static const LANDSCAPE_COLOR_SIDE:int = 0xCCCCCC;
        public static const LANDSCAPE_COLOR_BOTTOM:int = 0x999999;
        private static const ROOM_DEPTH_OFFSET:Number = 1000;

        private const _SafeStr_8747:int = 250;

        protected var _SafeStr_3740:RoomVisualizationData = null;
        private var _SafeStr_3745:AssetLibrary = null;
        private var _SafeStr_4111:RoomPlaneParser = null;
        private var _SafeStr_4565:Array = [];
        private var _SafeStr_4566:Boolean = false;
        private var _SafeStr_4969:Array = [];
        private var _visiblePlaneSpriteNumbers:Array = [];
        private var _boundingRectangle:Rectangle = null;
        private var _SafeStr_4966:RoomPlaneBitmapMaskParser = null;
        private var _SafeStr_4778:String = null;
        private var _SafeStr_4777:String = null;
        private var _SafeStr_4779:String = null;
        private var _SafeStr_4967:Number = NaN;
        private var _SafeStr_4968:Number = NaN;
        private var _floorHoleUpdateTime:Number = NaN;
        private var _SafeStr_4975:String = null;
        private var _backgroundColor:uint = 0xFFFFFF;
        private var _backgroundRed:int = 0xFF;
        private var _backgroundGreen:int = 0xFF;
        private var _backgroundBlue:int = 0xFF;
        private var _SafeStr_4970:Boolean = true;
        private var _SafeStr_4567:int = 0;
        private var _lastUpdateTime:int = -1000;
        private var _SafeStr_4072:int = -1;
        private var _SafeStr_4971:Number = 0;
        private var _SafeStr_4972:Number = 0;
        private var _SafeStr_4973:Number = 0;
        private var _SafeStr_4974:Number = 0;
        private var _SafeStr_4965:Array = [];

        public function RoomVisualization()
        {
            _SafeStr_3745 = new AssetLibrary("room visualization");
            _SafeStr_4111 = new RoomPlaneParser();
            _SafeStr_4966 = new RoomPlaneBitmapMaskParser();
            _SafeStr_4965[0] = false;
            _SafeStr_4965[2] = true;
            _SafeStr_4965[1] = true;
            _SafeStr_4965[3] = true;
        }

        public function get floorRelativeDepth():Number
        {
            return (1000 + 0.1);
        }

        public function get wallRelativeDepth():Number
        {
            return (1000 + 0.5);
        }

        public function get wallAdRelativeDepth():Number
        {
            return (1000 + 0.49);
        }

        public function get planeCount():int
        {
            return (_SafeStr_4565.length);
        }

        override public function dispose():void
        {
            var _local_1:int;
            var _local_2:* = null;
            super.dispose();
            if (_SafeStr_3745 != null)
            {
                _local_1 = 0;
                while (_local_1 < _SafeStr_3745.numAssets)
                {
                    _local_2 = _SafeStr_3745.getAssetByIndex(_local_1);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                    _local_1++;
                };
                _SafeStr_3745.dispose();
                _SafeStr_3745 = null;
            };
            resetRoomPlanes();
            _SafeStr_4565 = null;
            _SafeStr_4969 = null;
            _visiblePlaneSpriteNumbers = null;
            if (_SafeStr_4111 != null)
            {
                _SafeStr_4111.dispose();
                _SafeStr_4111 = null;
            };
            if (_SafeStr_4966 != null)
            {
                _SafeStr_4966.dispose();
                _SafeStr_4966 = null;
            };
            if (_SafeStr_3740 != null)
            {
                _SafeStr_3740.clearCache();
                _SafeStr_3740 = null;
            };
        }

        private function resetRoomPlanes():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_SafeStr_4565 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4565.length)
                {
                    _local_1 = (_SafeStr_4565[_local_2] as RoomPlane);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_4565 = [];
            };
            _SafeStr_4566 = false;
            _SafeStr_4567 = (_SafeStr_4567 + 1);
            reset();
        }

        override protected function reset():void
        {
            super.reset();
            _SafeStr_4778 = null;
            _SafeStr_4777 = null;
            _SafeStr_4779 = null;
            _SafeStr_4975 = null;
            _SafeStr_4072 = -1;
            _SafeStr_4974 = 0;
        }

        override public function get boundingRectangle():Rectangle
        {
            if (_boundingRectangle == null)
            {
                _boundingRectangle = super.boundingRectangle;
            };
            return (new Rectangle(_boundingRectangle.x, _boundingRectangle.y, _boundingRectangle.width, _boundingRectangle.height));
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            reset();
            if (((_arg_1 == null) || (!(_arg_1 is RoomVisualizationData))))
            {
                return (false);
            };
            _SafeStr_3740 = (_arg_1 as RoomVisualizationData);
            _SafeStr_3740.initializeAssetCollection(assetCollection);
            return (true);
        }

        protected function defineSprites():void
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_4:int = _SafeStr_4565.length;
            createSprites(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_1 = (_SafeStr_4565[_local_3] as RoomPlane);
                _local_2 = getSprite(_local_3);
                if (((((!(_local_2 == null)) && (!(_local_1 == null))) && (!(_local_1.leftSide == null))) && (!(_local_1.rightSide == null))))
                {
                    if (((_local_1.type == 1) && ((_local_1.leftSide.length < 1) || (_local_1.rightSide.length < 1))))
                    {
                        _local_2.alphaTolerance = 0x0100;
                    }
                    else
                    {
                        _local_2.alphaTolerance = 128;
                    };
                    if (_local_1.type == 1)
                    {
                        _local_2.tag = ("plane.wall@" + (_local_3 + 1));
                    }
                    else
                    {
                        if (_local_1.type == 2)
                        {
                            _local_2.tag = ("plane.floor@" + (_local_3 + 1));
                        }
                        else
                        {
                            _local_2.tag = ("plane@" + (_local_3 + 1));
                        };
                    };
                    _local_2.spriteType = RoomObjectSpriteType.ROOM_PLANE;
                };
                _local_3++;
            };
        }

        protected function initializeRoomPlanes():void
        {
            var _local_8:int;
            var _local_3:* = null;
            var _local_18:* = null;
            var _local_11:* = null;
            var _local_6:* = null;
            var _local_12:int;
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_19:Number;
            var _local_21:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_10:int;
            var _local_5:Number;
            var _local_2:Number;
            var _local_15:Number;
            var _local_9:Number;
            if (_SafeStr_4566)
            {
                return;
            };
            var _local_20:IRoomObject = object;
            if (_local_20 == null)
            {
                return;
            };
            if (!isNaN(_SafeStr_4967))
            {
                _SafeStr_4111.floorThicknessMultiplier = _SafeStr_4967;
            };
            if (!isNaN(_SafeStr_4968))
            {
                _SafeStr_4111.wallThicknessMultiplier = _SafeStr_4968;
            };
            var _local_7:String = _local_20.getModel().getString("room_plane_xml");
            if (!_SafeStr_4111.initializeFromXML(new XML(_local_7)))
            {
                return;
            };
            var _local_23:Number = getLandscapeWidth();
            var _local_17:Number = getLandscapeHeight();
            var _local_22:* = 0;
            var _local_16:int = _local_20.getModel().getNumber("room_random_seed");
            _local_8 = 0;
            while (_local_8 < _SafeStr_4111.planeCount)
            {
                _local_3 = _SafeStr_4111.getPlaneLocation(_local_8);
                _local_18 = _SafeStr_4111.getPlaneLeftSide(_local_8);
                _local_11 = _SafeStr_4111.getPlaneRightSide(_local_8);
                _local_6 = _SafeStr_4111.getPlaneSecondaryNormals(_local_8);
                _local_12 = _SafeStr_4111.getPlaneType(_local_8);
                _local_1 = null;
                if ((((!(_local_3 == null)) && (!(_local_18 == null))) && (!(_local_11 == null))))
                {
                    _local_4 = Vector3d.crossProduct(_local_18, _local_11);
                    _local_16 = ((_local_16 * 7613) + 517);
                    _local_1 = null;
                    if (_local_12 == 1)
                    {
                        _local_19 = ((_local_3.x + _local_18.x) + 0.5);
                        _local_21 = ((_local_3.y + _local_11.y) + 0.5);
                        _local_13 = (_local_19 - _local_19);
                        _local_14 = (_local_21 - _local_21);
                        _local_1 = new RoomPlane(_local_20.getLocation(), _local_3, _local_18, _local_11, 2, true, _local_6, _local_16, -(_local_13), -(_local_14));
                        if (_local_4.z != 0)
                        {
                            _local_1.color = 0xFFFFFF;
                        }
                        else
                        {
                            _local_1.color = ((_local_4.x != 0) ? 0xBBBBBB : 0xDDDDDD);
                        };
                        if (_SafeStr_3740 != null)
                        {
                            _local_1.rasterizer = _SafeStr_3740.floorRasterizer;
                        };
                    }
                    else
                    {
                        if (_local_12 == 2)
                        {
                            _local_1 = new RoomPlane(_local_20.getLocation(), _local_3, _local_18, _local_11, 1, true, _local_6, _local_16);
                            if (((_local_18.length < 1) || (_local_11.length < 1)))
                            {
                                _local_1.hasTexture = false;
                            };
                            if (((_local_4.x == 0) && (_local_4.y == 0)))
                            {
                                _local_1.color = 0x999999;
                            }
                            else
                            {
                                if (_local_4.y > 0)
                                {
                                    _local_1.color = 0xFFFFFF;
                                }
                                else
                                {
                                    if (_local_4.y == 0)
                                    {
                                        _local_1.color = 0xCCCCCC;
                                    }
                                    else
                                    {
                                        _local_1.color = 0x999999;
                                    };
                                };
                            };
                            if (_SafeStr_3740 != null)
                            {
                                _local_1.rasterizer = _SafeStr_3740.wallRasterizer;
                            };
                        }
                        else
                        {
                            if (_local_12 == 3)
                            {
                                _local_1 = new RoomPlane(_local_20.getLocation(), _local_3, _local_18, _local_11, 3, true, _local_6, _local_16, _local_22, 0, _local_23, _local_17);
                                if (_local_4.y > 0)
                                {
                                    _local_1.color = 0xFFFFFF;
                                }
                                else
                                {
                                    if (_local_4.y == 0)
                                    {
                                        _local_1.color = 0xCCCCCC;
                                    }
                                    else
                                    {
                                        _local_1.color = 0x999999;
                                    };
                                };
                                if (_SafeStr_3740 != null)
                                {
                                    _local_1.rasterizer = _SafeStr_3740.landscapeRasterizer;
                                };
                                _local_22 = (_local_22 + _local_18.length);
                            }
                            else
                            {
                                if (_local_12 == 4)
                                {
                                    _local_1 = new RoomPlane(_local_20.getLocation(), _local_3, _local_18, _local_11, 1, true, _local_6, _local_16);
                                    if (((_local_18.length < 1) || (_local_11.length < 1)))
                                    {
                                        _local_1.hasTexture = false;
                                    };
                                    if (((_local_4.x == 0) && (_local_4.y == 0)))
                                    {
                                        _local_1.color = 0x999999;
                                    }
                                    else
                                    {
                                        if (_local_4.y > 0)
                                        {
                                            _local_1.color = 0xFFFFFF;
                                        }
                                        else
                                        {
                                            if (_local_4.y == 0)
                                            {
                                                _local_1.color = 0xCCCCCC;
                                            }
                                            else
                                            {
                                                _local_1.color = 0x999999;
                                            };
                                        };
                                    };
                                    if (_SafeStr_3740 != null)
                                    {
                                        _local_1.rasterizer = _SafeStr_3740.wallAdRasterizr;
                                    };
                                };
                            };
                        };
                    };
                    if (_local_1 != null)
                    {
                        _local_1.maskManager = _SafeStr_3740.maskManager;
                        _local_10 = 0;
                        while (_local_10 < _SafeStr_4111.getPlaneMaskCount(_local_8))
                        {
                            _local_5 = _SafeStr_4111.getPlaneMaskLeftSideLoc(_local_8, _local_10);
                            _local_2 = _SafeStr_4111.getPlaneMaskRightSideLoc(_local_8, _local_10);
                            _local_15 = _SafeStr_4111.getPlaneMaskLeftSideLength(_local_8, _local_10);
                            _local_9 = _SafeStr_4111.getPlaneMaskRightSideLength(_local_8, _local_10);
                            _local_1.addRectangleMask(_local_5, _local_2, _local_15, _local_9);
                            _local_10++;
                        };
                        _SafeStr_4565.push(_local_1);
                    };
                }
                else
                {
                    return;
                };
                _local_8++;
            };
            _SafeStr_4566 = true;
            defineSprites();
        }

        private function getLandscapeWidth():Number
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:* = null;
            var _local_4:* = 0;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4111.planeCount)
            {
                _local_3 = _SafeStr_4111.getPlaneType(_local_2);
                if (_local_3 == 3)
                {
                    _local_1 = _SafeStr_4111.getPlaneLeftSide(_local_2);
                    _local_4 = (_local_4 + _local_1.length);
                };
                _local_2++;
            };
            return (_local_4);
        }

        private function getLandscapeHeight():Number
        {
            var _local_2:int;
            var _local_4:int;
            var _local_3:* = null;
            var _local_1:* = 0;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4111.planeCount)
            {
                _local_4 = _SafeStr_4111.getPlaneType(_local_2);
                if (_local_4 == 3)
                {
                    _local_3 = _SafeStr_4111.getPlaneRightSide(_local_2);
                    if (_local_3.length > _local_1)
                    {
                        _local_1 = _local_3.length;
                    };
                };
                _local_2++;
            };
            if (_local_1 > 5)
            {
                _local_1 = 5;
            };
            return (_local_1);
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_8:int;
            var _local_16:int;
            var _local_14:* = null;
            var _local_5:* = null;
            var _local_7:uint;
            var _local_11:uint;
            var _local_6:uint;
            var _local_10:uint;
            var _local_13:uint;
            var _local_12:IRoomObject = object;
            if (_local_12 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            var _local_9:Boolean = updateGeometry(_arg_1);
            var _local_15:IRoomObjectModel = _local_12.getModel();
            var _local_18:Boolean;
            if (updatePlaneThicknesses(_local_15))
            {
                _local_18 = true;
            };
            if (updateFloorHoles(_local_15))
            {
                _local_18 = true;
            };
            initializeRoomPlanes();
            _local_18 = updateMasksAndColors(_local_15);
            var _local_17:* = _arg_2;
            if ((((_local_17 < (_lastUpdateTime + 250)) && (!(_local_9))) && (!(_local_18))))
            {
                return;
            };
            if (updatePlaneTexturesAndVisibilities(_local_15))
            {
                _local_18 = true;
            };
            if (updatePlanes(_arg_1, _local_9, _arg_2))
            {
                _local_18 = true;
            };
            if (_local_18)
            {
                _local_8 = 0;
                while (_local_8 < _SafeStr_4969.length)
                {
                    _local_16 = _visiblePlaneSpriteNumbers[_local_8];
                    _local_14 = getSprite(_local_16);
                    _local_5 = (_SafeStr_4969[_local_8] as RoomPlane);
                    if ((((!(_local_14 == null)) && (!(_local_5 == null))) && (!(_local_5.type == 3))))
                    {
                        if (_SafeStr_4970)
                        {
                            _local_7 = _local_5.color;
                            _local_11 = uint((((_local_7 & 0xFF) * _backgroundBlue) / 0xFF));
                            _local_6 = uint(((((_local_7 >> 8) & 0xFF) * _backgroundGreen) / 0xFF));
                            _local_10 = uint(((((_local_7 >> 16) & 0xFF) * _backgroundRed) / 0xFF));
                            _local_13 = (_local_7 >> 24);
                            _local_7 = ((((_local_13 << 24) + (_local_10 << 16)) + (_local_6 << 8)) + _local_11);
                            _local_14.color = _local_7;
                        }
                        else
                        {
                            _local_14.color = _local_5.color;
                        };
                    };
                    _local_8++;
                };
                increaseUpdateId();
            };
            _SafeStr_4170 = _local_15.getUpdateID();
            _lastUpdateTime = _local_17;
        }

        private function updateGeometry(_arg_1:IRoomGeometry):Boolean
        {
            var _local_2:* = null;
            var _local_3:Boolean;
            if (_arg_1.updateId != _SafeStr_4072)
            {
                _SafeStr_4072 = _arg_1.updateId;
                _boundingRectangle = null;
                _local_2 = _arg_1.direction;
                if (((!(_local_2 == null)) && ((((!(_local_2.x == _SafeStr_4971)) || (!(_local_2.y == _SafeStr_4972))) || (!(_local_2.z == _SafeStr_4973))) || (!(_arg_1.scale == _SafeStr_4974)))))
                {
                    _SafeStr_4971 = _local_2.x;
                    _SafeStr_4972 = _local_2.y;
                    _SafeStr_4973 = _local_2.z;
                    _SafeStr_4974 = _arg_1.scale;
                    _local_3 = true;
                };
            };
            return (_local_3);
        }

        private function updateMasksAndColors(_arg_1:IRoomObjectModel):Boolean
        {
            var _local_2:* = null;
            var _local_3:uint;
            var _local_4:Boolean;
            var _local_5:Boolean;
            if (_SafeStr_4170 != _arg_1.getUpdateID())
            {
                _local_2 = _arg_1.getString("room_plane_mask_xml");
                if (_local_2 != _SafeStr_4975)
                {
                    updatePlaneMasks(_local_2);
                    _SafeStr_4975 = _local_2;
                    _local_5 = true;
                };
                _local_3 = _arg_1.getNumber("room_background_color");
                if (_local_3 != _backgroundColor)
                {
                    _backgroundColor = _local_3;
                    _backgroundBlue = (_backgroundColor & 0xFF);
                    _backgroundGreen = ((_backgroundColor >> 8) & 0xFF);
                    _backgroundRed = ((_backgroundColor >> 16) & 0xFF);
                    _local_5 = true;
                };
                _local_4 = _arg_1.getNumber("room_colorize_bg_only");
                if (_local_4 != _SafeStr_4970)
                {
                    _SafeStr_4970 = _local_4;
                    _local_5 = true;
                };
            };
            return (_local_5);
        }

        private function updatePlaneTexturesAndVisibilities(_arg_1:IRoomObjectModel):Boolean
        {
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_3:Boolean;
            var _local_7:Boolean;
            var _local_4:Boolean;
            if (_SafeStr_4170 != _arg_1.getUpdateID())
            {
                _local_5 = _arg_1.getString("room_wall_type");
                _local_6 = _arg_1.getString("room_floor_type");
                _local_2 = _arg_1.getString("room_landscape_type");
                updatePlaneTextureTypes(_local_6, _local_5, _local_2);
                _local_3 = _arg_1.getNumber("room_floor_visibility");
                _local_7 = _arg_1.getNumber("room_wall_visibility");
                _local_4 = _arg_1.getNumber("room_landscape_visibility");
                updatePlaneTypeVisibilities(_local_3, _local_7, _local_4);
                return (true);
            };
            return (false);
        }

        private function updatePlaneThicknesses(_arg_1:IRoomObjectModel):Boolean
        {
            var _local_3:Number;
            var _local_2:Number;
            if (_SafeStr_4170 != _arg_1.getUpdateID())
            {
                _local_3 = _arg_1.getNumber("room_floor_thickness");
                _local_2 = _arg_1.getNumber("room_wall_thickness");
                if ((((!(isNaN(_local_3))) && (!(isNaN(_local_2)))) && ((!(_local_3 == _SafeStr_4967)) || (!(_local_2 == _SafeStr_4968)))))
                {
                    _SafeStr_4967 = _local_3;
                    _SafeStr_4968 = _local_2;
                    resetRoomPlanes();
                    return (true);
                };
            };
            return (false);
        }

        private function updateFloorHoles(_arg_1:IRoomObjectModel):Boolean
        {
            var _local_2:Number;
            if (_SafeStr_4170 != _arg_1.getUpdateID())
            {
                _local_2 = _arg_1.getNumber("room_floor_hole_update_time");
                if (((!(isNaN(_local_2))) && (!(_local_2 == _floorHoleUpdateTime))))
                {
                    _floorHoleUpdateTime = _local_2;
                    resetRoomPlanes();
                    return (true);
                };
            };
            return (false);
        }

        protected function updatePlaneTextureTypes(_arg_1:String, _arg_2:String, _arg_3:String):Boolean
        {
            var _local_5:int;
            var _local_4:* = null;
            if (_arg_1 != _SafeStr_4777)
            {
                _SafeStr_4777 = _arg_1;
            }
            else
            {
                _arg_1 = null;
            };
            if (_arg_2 != _SafeStr_4778)
            {
                _SafeStr_4778 = _arg_2;
            }
            else
            {
                _arg_2 = null;
            };
            if (_arg_3 != _SafeStr_4779)
            {
                _SafeStr_4779 = _arg_3;
            }
            else
            {
                _arg_3 = null;
            };
            if ((((_arg_1 == null) && (_arg_2 == null)) && (_arg_3 == null)))
            {
                return (false);
            };
            _local_5 = 0;
            while (_local_5 < _SafeStr_4565.length)
            {
                _local_4 = (_SafeStr_4565[_local_5] as RoomPlane);
                if (_local_4 != null)
                {
                    if (((_local_4.type == 2) && (!(_arg_1 == null))))
                    {
                        _local_4.id = _arg_1;
                    }
                    else
                    {
                        if (((_local_4.type == 1) && (!(_arg_2 == null))))
                        {
                            _local_4.id = _arg_2;
                        }
                        else
                        {
                            if (((_local_4.type == 3) && (!(_arg_3 == null))))
                            {
                                _local_4.id = _arg_3;
                            };
                        };
                    };
                };
                _local_5++;
            };
            return (true);
        }

        private function updatePlaneTypeVisibilities(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean):void
        {
            if ((((!(_arg_1 == _SafeStr_4965[2])) || (!(_arg_2 == _SafeStr_4965[1]))) || (!(_arg_3 == _SafeStr_4965[3]))))
            {
                _SafeStr_4965[2] = _arg_1;
                _SafeStr_4965[1] = _arg_2;
                _SafeStr_4965[3] = _arg_3;
                _SafeStr_4969 = [];
                _visiblePlaneSpriteNumbers = [];
            };
        }

        protected function updatePlanes(_arg_1:IRoomGeometry, _arg_2:Boolean, _arg_3:int):Boolean
        {
            var _local_8:int;
            var _local_9:int;
            var _local_12:* = null;
            var _local_4:* = null;
            var _local_10:Number;
            var _local_13:* = null;
            var _local_11:IRoomObject = object;
            if (_local_11 == null)
            {
                return (false);
            };
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4567++;
            if (_arg_2)
            {
                _SafeStr_4969 = [];
                _visiblePlaneSpriteNumbers = [];
            };
            var _local_5:* = _arg_3;
            var _local_6:Array = _SafeStr_4969;
            if (_SafeStr_4969.length == 0)
            {
                _local_6 = _SafeStr_4565;
            };
            var _local_14:Boolean;
            var _local_7:* = (_SafeStr_4969.length > 0);
            _local_8 = 0;
            while (_local_8 < _local_6.length)
            {
                _local_9 = _local_8;
                if (_local_7)
                {
                    _local_9 = _visiblePlaneSpriteNumbers[_local_8];
                };
                _local_12 = getSprite(_local_9);
                if (_local_12 != null)
                {
                    _local_4 = (_local_6[_local_8] as RoomPlane);
                    if (_local_4 != null)
                    {
                        _local_12.planeId = _local_4.uniqueId;
                        if (_local_4.update(_arg_1, _local_5))
                        {
                            if (_local_4.visible)
                            {
                                _local_10 = ((_local_4.relativeDepth + floorRelativeDepth) + (_local_9 / 1000));
                                if (_local_4.type != 2)
                                {
                                    _local_10 = ((_local_4.relativeDepth + wallRelativeDepth) + (_local_9 / 1000));
                                    if (((_local_4.leftSide.length < 1) || (_local_4.rightSide.length < 1)))
                                    {
                                        _local_10 = (_local_10 + (1000 * 0.5));
                                    };
                                };
                                _local_13 = ((("plane " + _local_9) + " ") + _arg_1.scale);
                                updateSprite(_local_12, _local_4, _local_13, _local_10);
                            };
                            _local_14 = true;
                        };
                        if (_local_12.visible != ((_local_4.visible) && (_SafeStr_4965[_local_4.type])))
                        {
                            _local_12.visible = (!(_local_12.visible));
                            _local_14 = true;
                        };
                        if (_local_12.visible)
                        {
                            if (!_local_7)
                            {
                                _SafeStr_4969.push(_local_4);
                                _visiblePlaneSpriteNumbers.push(_local_8);
                            };
                        };
                    }
                    else
                    {
                        _local_12.planeId = 0;
                        if (_local_12.visible)
                        {
                            _local_12.visible = false;
                            _local_14 = true;
                        };
                    };
                };
                _local_8++;
            };
            return (_local_14);
        }

        private function updateSprite(_arg_1:IRoomObjectSprite, _arg_2:RoomPlane, _arg_3:String, _arg_4:Number):void
        {
            var _local_5:Point = _arg_2.offset;
            _arg_1.offsetX = -(_local_5.x);
            _arg_1.offsetY = -(_local_5.y);
            _arg_1.relativeDepth = _arg_4;
            _arg_1.color = _arg_2.color;
            _arg_1.asset = getPlaneBitmap(_arg_2, _arg_3);
            _arg_1.assetName = ((_arg_3 + "_") + _SafeStr_4567);
        }

        private function getPlaneBitmap(_arg_1:RoomPlane, _arg_2:String):BitmapData
        {
            var _local_4:BitmapDataAsset = (_SafeStr_3745.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_4 == null)
            {
                _local_4 = new BitmapDataAsset(_SafeStr_3745.getAssetTypeDeclarationByClass(BitmapDataAsset));
                _SafeStr_3745.setAsset(_arg_2, _local_4);
            };
            var _local_5:BitmapData = (_local_4.content as BitmapData);
            var _local_3:BitmapData = _arg_1.copyBitmapData(_local_5);
            if (_local_3 == null)
            {
                _local_3 = _arg_1.bitmapData;
                if (_local_3 != null)
                {
                    if (_local_5 != _local_3)
                    {
                        if (_local_5 != null)
                        {
                            _local_5.dispose();
                        };
                        _local_4.setUnknownContent(_local_3);
                    };
                };
            };
            return (_local_3);
        }

        protected function updatePlaneMasks(_arg_1:String):void
        {
            var _local_10:int;
            var _local_11:int;
            var _local_7:* = null;
            var _local_9:* = null;
            var _local_12:* = null;
            var _local_13:int;
            var _local_18:* = null;
            var _local_8:Number;
            var _local_5:Number;
            var _local_3:Number;
            var _local_15:int;
            var _local_4:int;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_17:XML = XML(_arg_1);
            _SafeStr_4966.initialize(_local_17);
            var _local_2:RoomPlane;
            var _local_14:Array = [];
            var _local_16:Array = [];
            var _local_6:Boolean;
            _local_10 = 0;
            while (_local_10 < _SafeStr_4565.length)
            {
                _local_2 = (_SafeStr_4565[_local_10] as RoomPlane);
                if (_local_2 != null)
                {
                    _local_2.resetBitmapMasks();
                    if (_local_2.type == 3)
                    {
                        _local_14.push(_local_10);
                    };
                };
                _local_10++;
            };
            _local_11 = 0;
            while (_local_11 < _SafeStr_4966.maskCount)
            {
                _local_7 = _SafeStr_4966.getMaskType(_local_11);
                _local_9 = _SafeStr_4966.getMaskLocation(_local_11);
                _local_12 = _SafeStr_4966.getMaskCategory(_local_11);
                if (_local_9 != null)
                {
                    _local_13 = 0;
                    while (_local_13 < _SafeStr_4565.length)
                    {
                        _local_2 = (_SafeStr_4565[_local_13] as RoomPlane);
                        if (((_local_2.type == 1) || (_local_2.type == 3)))
                        {
                            if ((((!(_local_2 == null)) && (!(_local_2.location == null))) && (!(_local_2.normal == null))))
                            {
                                _local_18 = Vector3d.dif(_local_9, _local_2.location);
                                _local_8 = Math.abs(Vector3d.scalarProjection(_local_18, _local_2.normal));
                                if (_local_8 < 0.01)
                                {
                                    if (((!(_local_2.leftSide == null)) && (!(_local_2.rightSide == null))))
                                    {
                                        _local_5 = Vector3d.scalarProjection(_local_18, _local_2.leftSide);
                                        _local_3 = Vector3d.scalarProjection(_local_18, _local_2.rightSide);
                                        if (((_local_2.type == 1) || ((_local_2.type == 3) && (_local_12 == "hole"))))
                                        {
                                            _local_2.addBitmapMask(_local_7, _local_5, _local_3);
                                        }
                                        else
                                        {
                                            if (_local_2.type == 3)
                                            {
                                                if (!_local_2.canBeVisible)
                                                {
                                                    _local_6 = true;
                                                };
                                                _local_2.canBeVisible = true;
                                                _local_16.push(_local_13);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        _local_13++;
                    };
                };
                _local_11++;
            };
            _local_15 = 0;
            while (_local_15 < _local_14.length)
            {
                _local_4 = _local_14[_local_15];
                if (_local_16.indexOf(_local_4) < 0)
                {
                    _local_2 = (_SafeStr_4565[_local_4] as RoomPlane);
                    _local_2.canBeVisible = false;
                    _local_6 = true;
                };
                _local_15++;
            };
            if (_local_6)
            {
                _SafeStr_4969 = [];
                _visiblePlaneSpriteNumbers = [];
            };
        }

        public function get planes():Vector.<IRoomPlane>
        {
            var _local_2:Vector.<IRoomPlane> = new Vector.<IRoomPlane>(0);
            for each (var _local_1:RoomPlane in _SafeStr_4969)
            {
                _local_2.push(_local_1);
            };
            return (_local_2);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_4072 = "_-Ds" (String#2730, DoABC#4)
// _SafeStr_4111 = "_-R8" (String#1514, DoABC#4)
// _SafeStr_4170 = "_-t1V" (String#3658, DoABC#4)
// _SafeStr_4565 = "_-qP" (String#1942, DoABC#4)
// _SafeStr_4566 = "_-Uv" (String#7396, DoABC#4)
// _SafeStr_4567 = "_-T1E" (String#5556, DoABC#4)
// _SafeStr_4777 = "_-S1M" (String#5362, DoABC#4)
// _SafeStr_4778 = "_-xi" (String#5315, DoABC#4)
// _SafeStr_4779 = "_-BB" (String#5266, DoABC#4)
// _SafeStr_4965 = "_-nN" (String#5262, DoABC#4)
// _SafeStr_4966 = "_-GY" (String#3507, DoABC#4)
// _SafeStr_4967 = "_-jc" (String#13133, DoABC#4)
// _SafeStr_4968 = "_-12O" (String#13278, DoABC#4)
// _SafeStr_4969 = "_-029" (String#4246, DoABC#4)
// _SafeStr_4970 = "_-C7" (String#14061, DoABC#4)
// _SafeStr_4971 = "_-J1U" (String#6994, DoABC#4)
// _SafeStr_4972 = "_-fh" (String#9089, DoABC#4)
// _SafeStr_4973 = "_-BW" (String#9266, DoABC#4)
// _SafeStr_4974 = "_-h16" (String#7687, DoABC#4)
// _SafeStr_4975 = "_-51m" (String#13083, DoABC#4)
// _SafeStr_8747 = "_-8V" (String#30697, DoABC#4)
// _SafeStr_8765 = "_-Dl" (String#39672, DoABC#4)
// _SafeStr_8766 = "_-Uu" (String#39405, DoABC#4)
// _SafeStr_8767 = "_-71h" (String#33902, DoABC#4)


