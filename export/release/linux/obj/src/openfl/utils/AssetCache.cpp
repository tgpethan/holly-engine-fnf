// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_StringTools
#include <StringTools.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_lime_text_Font
#include <lime/text/Font.h>
#endif
#ifndef INCLUDED_lime_utils_AssetCache
#include <lime/utils/AssetCache.h>
#endif
#ifndef INCLUDED_lime_utils_Assets
#include <lime/utils/Assets.h>
#endif
#ifndef INCLUDED_openfl_display_BitmapData
#include <openfl/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_media_Sound
#include <openfl/media/Sound.h>
#endif
#ifndef INCLUDED_openfl_text_Font
#include <openfl/text/Font.h>
#endif
#ifndef INCLUDED_openfl_utils_AssetCache
#include <openfl/utils/AssetCache.h>
#endif
#ifndef INCLUDED_openfl_utils_IAssetCache
#include <openfl/utils/IAssetCache.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_3b51c86a24135fbd_20_new,"openfl.utils.AssetCache","new",0x1485f77f,"openfl.utils.AssetCache.new","openfl/utils/AssetCache.hx",20,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_82_clear,"openfl.utils.AssetCache","clear",0x6abcde6c,"openfl.utils.AssetCache.clear","openfl/utils/AssetCache.hx",82,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_130_getBitmapData,"openfl.utils.AssetCache","getBitmapData",0x142af5ce,"openfl.utils.AssetCache.getBitmapData","openfl/utils/AssetCache.hx",130,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_141_getFont,"openfl.utils.AssetCache","getFont",0xa580b024,"openfl.utils.AssetCache.getFont","openfl/utils/AssetCache.hx",141,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_152_getSound,"openfl.utils.AssetCache","getSound",0xa75444da,"openfl.utils.AssetCache.getSound","openfl/utils/AssetCache.hx",152,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_163_hasBitmapData,"openfl.utils.AssetCache","hasBitmapData",0xd20f5192,"openfl.utils.AssetCache.hasBitmapData","openfl/utils/AssetCache.hx",163,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_174_hasFont,"openfl.utils.AssetCache","hasFont",0xa24220e8,"openfl.utils.AssetCache.hasFont","openfl/utils/AssetCache.hx",174,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_185_hasSound,"openfl.utils.AssetCache","hasSound",0xd3d57f96,"openfl.utils.AssetCache.hasSound","openfl/utils/AssetCache.hx",185,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_195_removeBitmapData,"openfl.utils.AssetCache","removeBitmapData",0x9ca8649e,"openfl.utils.AssetCache.removeBitmapData","openfl/utils/AssetCache.hx",195,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_209_removeFont,"openfl.utils.AssetCache","removeFont",0x136c22f4,"openfl.utils.AssetCache.removeFont","openfl/utils/AssetCache.hx",209,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_223_removeSound,"openfl.utils.AssetCache","removeSound",0x676d480a,"openfl.utils.AssetCache.removeSound","openfl/utils/AssetCache.hx",223,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_238_setBitmapData,"openfl.utils.AssetCache","setBitmapData",0x5930d7da,"openfl.utils.AssetCache.setBitmapData","openfl/utils/AssetCache.hx",238,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_249_setFont,"openfl.utils.AssetCache","setFont",0x98824130,"openfl.utils.AssetCache.setFont","openfl/utils/AssetCache.hx",249,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_260_setSound,"openfl.utils.AssetCache","setSound",0x55b19e4e,"openfl.utils.AssetCache.setSound","openfl/utils/AssetCache.hx",260,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_266_get_enabled,"openfl.utils.AssetCache","get_enabled",0xec9842b7,"openfl.utils.AssetCache.get_enabled","openfl/utils/AssetCache.hx",266,0xffd5b4cf)
HX_LOCAL_STACK_FRAME(_hx_pos_3b51c86a24135fbd_271_set_enabled,"openfl.utils.AssetCache","set_enabled",0xf70549c3,"openfl.utils.AssetCache.set_enabled","openfl/utils/AssetCache.hx",271,0xffd5b4cf)
namespace openfl{
namespace utils{

void AssetCache_obj::__construct(){
            	HX_GC_STACKFRAME(&_hx_pos_3b51c86a24135fbd_20_new)
HXLINE(  42)		this->_hx___enabled = true;
HXLINE(  59)		this->bitmapData =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
HXLINE(  60)		this->font =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
HXLINE(  61)		this->sound =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
            	}

Dynamic AssetCache_obj::__CreateEmpty() { return new AssetCache_obj; }

void *AssetCache_obj::_hx_vtable = 0;

Dynamic AssetCache_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< AssetCache_obj > _hx_result = new AssetCache_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool AssetCache_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0d7331b3;
}

static ::openfl::utils::IAssetCache_obj _hx_openfl_utils_AssetCache__hx_openfl_utils_IAssetCache= {
	( bool (::hx::Object::*)())&::openfl::utils::AssetCache_obj::get_enabled,
	( bool (::hx::Object::*)(bool))&::openfl::utils::AssetCache_obj::set_enabled,
	( void (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::clear,
	(  ::openfl::display::BitmapData (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::getBitmapData,
	(  ::openfl::text::Font (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::getFont,
	(  ::openfl::media::Sound (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::getSound,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::hasBitmapData,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::hasFont,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::hasSound,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::removeBitmapData,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::removeFont,
	( bool (::hx::Object::*)(::String))&::openfl::utils::AssetCache_obj::removeSound,
	( void (::hx::Object::*)(::String, ::openfl::display::BitmapData))&::openfl::utils::AssetCache_obj::setBitmapData,
	( void (::hx::Object::*)(::String, ::openfl::text::Font))&::openfl::utils::AssetCache_obj::setFont,
	( void (::hx::Object::*)(::String, ::openfl::media::Sound))&::openfl::utils::AssetCache_obj::setSound,
};

void *AssetCache_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x8a5cf29a: return &_hx_openfl_utils_AssetCache__hx_openfl_utils_IAssetCache;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

void AssetCache_obj::clear(::String prefix){
            	HX_GC_STACKFRAME(&_hx_pos_3b51c86a24135fbd_82_clear)
HXDLIN(  82)		if (::hx::IsNull( prefix )) {
HXLINE(  84)			this->bitmapData =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
HXLINE(  85)			this->font =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
HXLINE(  86)			this->sound =  ::haxe::ds::StringMap_obj::__alloc( HX_CTX );
            		}
            		else {
HXLINE(  90)			 ::Dynamic keys = this->bitmapData->keys();
HXLINE(  92)			{
HXLINE(  92)				 ::Dynamic key = keys;
HXDLIN(  92)				while(( (bool)(key->__Field(HX_("hasNext",6d,a5,46,18),::hx::paccDynamic)()) )){
HXLINE(  92)					::String key1 = ( (::String)(key->__Field(HX_("next",f3,84,02,49),::hx::paccDynamic)()) );
HXLINE(  94)					if (::StringTools_obj::startsWith(key1,prefix)) {
HXLINE(  96)						this->removeBitmapData(key1);
            					}
            				}
            			}
HXLINE( 100)			 ::Dynamic keys1 = this->font->keys();
HXLINE( 102)			{
HXLINE( 102)				 ::Dynamic key1 = keys1;
HXDLIN( 102)				while(( (bool)(key1->__Field(HX_("hasNext",6d,a5,46,18),::hx::paccDynamic)()) )){
HXLINE( 102)					::String key = ( (::String)(key1->__Field(HX_("next",f3,84,02,49),::hx::paccDynamic)()) );
HXLINE( 104)					if (::StringTools_obj::startsWith(key,prefix)) {
HXLINE( 106)						this->removeFont(key);
            					}
            				}
            			}
HXLINE( 110)			 ::Dynamic keys2 = this->sound->keys();
HXLINE( 112)			{
HXLINE( 112)				 ::Dynamic key2 = keys2;
HXDLIN( 112)				while(( (bool)(key2->__Field(HX_("hasNext",6d,a5,46,18),::hx::paccDynamic)()) )){
HXLINE( 112)					::String key = ( (::String)(key2->__Field(HX_("next",f3,84,02,49),::hx::paccDynamic)()) );
HXLINE( 114)					if (::StringTools_obj::startsWith(key,prefix)) {
HXLINE( 116)						this->removeSound(key);
            					}
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,clear,(void))

 ::openfl::display::BitmapData AssetCache_obj::getBitmapData(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_130_getBitmapData)
HXDLIN( 130)		return ( ( ::openfl::display::BitmapData)(this->bitmapData->get(id)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,getBitmapData,return )

 ::openfl::text::Font AssetCache_obj::getFont(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_141_getFont)
HXDLIN( 141)		return ( ( ::openfl::text::Font)(this->font->get(id)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,getFont,return )

 ::openfl::media::Sound AssetCache_obj::getSound(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_152_getSound)
HXDLIN( 152)		return ( ( ::openfl::media::Sound)(this->sound->get(id)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,getSound,return )

bool AssetCache_obj::hasBitmapData(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_163_hasBitmapData)
HXDLIN( 163)		return this->bitmapData->exists(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,hasBitmapData,return )

bool AssetCache_obj::hasFont(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_174_hasFont)
HXDLIN( 174)		return this->font->exists(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,hasFont,return )

bool AssetCache_obj::hasSound(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_185_hasSound)
HXDLIN( 185)		return this->sound->exists(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,hasSound,return )

bool AssetCache_obj::removeBitmapData(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_195_removeBitmapData)
HXLINE( 197)		::lime::utils::Assets_obj::cache->image->remove(id);
HXLINE( 199)		return this->bitmapData->remove(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,removeBitmapData,return )

bool AssetCache_obj::removeFont(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_209_removeFont)
HXLINE( 211)		::lime::utils::Assets_obj::cache->font->remove(id);
HXLINE( 213)		return this->font->remove(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,removeFont,return )

bool AssetCache_obj::removeSound(::String id){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_223_removeSound)
HXLINE( 225)		::lime::utils::Assets_obj::cache->audio->remove(id);
HXLINE( 227)		return this->sound->remove(id);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,removeSound,return )

void AssetCache_obj::setBitmapData(::String id, ::openfl::display::BitmapData bitmapData){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_238_setBitmapData)
HXDLIN( 238)		this->bitmapData->set(id,bitmapData);
            	}


HX_DEFINE_DYNAMIC_FUNC2(AssetCache_obj,setBitmapData,(void))

void AssetCache_obj::setFont(::String id, ::openfl::text::Font font){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_249_setFont)
HXDLIN( 249)		this->font->set(id,font);
            	}


HX_DEFINE_DYNAMIC_FUNC2(AssetCache_obj,setFont,(void))

void AssetCache_obj::setSound(::String id, ::openfl::media::Sound sound){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_260_setSound)
HXDLIN( 260)		this->sound->set(id,sound);
            	}


HX_DEFINE_DYNAMIC_FUNC2(AssetCache_obj,setSound,(void))

bool AssetCache_obj::get_enabled(){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_266_get_enabled)
HXDLIN( 266)		return this->_hx___enabled;
            	}


HX_DEFINE_DYNAMIC_FUNC0(AssetCache_obj,get_enabled,return )

bool AssetCache_obj::set_enabled(bool value){
            	HX_STACKFRAME(&_hx_pos_3b51c86a24135fbd_271_set_enabled)
HXDLIN( 271)		return (this->_hx___enabled = value);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetCache_obj,set_enabled,return )


::hx::ObjectPtr< AssetCache_obj > AssetCache_obj::__new() {
	::hx::ObjectPtr< AssetCache_obj > __this = new AssetCache_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< AssetCache_obj > AssetCache_obj::__alloc(::hx::Ctx *_hx_ctx) {
	AssetCache_obj *__this = (AssetCache_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(AssetCache_obj), true, "openfl.utils.AssetCache"));
	*(void **)__this = AssetCache_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

AssetCache_obj::AssetCache_obj()
{
}

void AssetCache_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(AssetCache);
	HX_MARK_MEMBER_NAME(bitmapData,"bitmapData");
	HX_MARK_MEMBER_NAME(font,"font");
	HX_MARK_MEMBER_NAME(sound,"sound");
	HX_MARK_MEMBER_NAME(_hx___enabled,"__enabled");
	HX_MARK_END_CLASS();
}

void AssetCache_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(bitmapData,"bitmapData");
	HX_VISIT_MEMBER_NAME(font,"font");
	HX_VISIT_MEMBER_NAME(sound,"sound");
	HX_VISIT_MEMBER_NAME(_hx___enabled,"__enabled");
}

::hx::Val AssetCache_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"font") ) { return ::hx::Val( font ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"sound") ) { return ::hx::Val( sound ); }
		if (HX_FIELD_EQ(inName,"clear") ) { return ::hx::Val( clear_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"enabled") ) { if (inCallProp == ::hx::paccAlways) return ::hx::Val( get_enabled() ); }
		if (HX_FIELD_EQ(inName,"getFont") ) { return ::hx::Val( getFont_dyn() ); }
		if (HX_FIELD_EQ(inName,"hasFont") ) { return ::hx::Val( hasFont_dyn() ); }
		if (HX_FIELD_EQ(inName,"setFont") ) { return ::hx::Val( setFont_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getSound") ) { return ::hx::Val( getSound_dyn() ); }
		if (HX_FIELD_EQ(inName,"hasSound") ) { return ::hx::Val( hasSound_dyn() ); }
		if (HX_FIELD_EQ(inName,"setSound") ) { return ::hx::Val( setSound_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"__enabled") ) { return ::hx::Val( _hx___enabled ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bitmapData") ) { return ::hx::Val( bitmapData ); }
		if (HX_FIELD_EQ(inName,"removeFont") ) { return ::hx::Val( removeFont_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"removeSound") ) { return ::hx::Val( removeSound_dyn() ); }
		if (HX_FIELD_EQ(inName,"get_enabled") ) { return ::hx::Val( get_enabled_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_enabled") ) { return ::hx::Val( set_enabled_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"getBitmapData") ) { return ::hx::Val( getBitmapData_dyn() ); }
		if (HX_FIELD_EQ(inName,"hasBitmapData") ) { return ::hx::Val( hasBitmapData_dyn() ); }
		if (HX_FIELD_EQ(inName,"setBitmapData") ) { return ::hx::Val( setBitmapData_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"removeBitmapData") ) { return ::hx::Val( removeBitmapData_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val AssetCache_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"font") ) { font=inValue.Cast<  ::haxe::ds::StringMap >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"sound") ) { sound=inValue.Cast<  ::haxe::ds::StringMap >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"enabled") ) { if (inCallProp == ::hx::paccAlways) return ::hx::Val( set_enabled(inValue.Cast< bool >()) ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"__enabled") ) { _hx___enabled=inValue.Cast< bool >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bitmapData") ) { bitmapData=inValue.Cast<  ::haxe::ds::StringMap >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void AssetCache_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("enabled",81,04,31,7e));
	outFields->push(HX_("bitmapData",b9,b5,c0,33));
	outFields->push(HX_("font",cf,5d,c0,43));
	outFields->push(HX_("sound",cf,8c,cc,80));
	outFields->push(HX_("__enabled",61,55,7f,ff));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo AssetCache_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::haxe::ds::StringMap */ ,(int)offsetof(AssetCache_obj,bitmapData),HX_("bitmapData",b9,b5,c0,33)},
	{::hx::fsObject /*  ::haxe::ds::StringMap */ ,(int)offsetof(AssetCache_obj,font),HX_("font",cf,5d,c0,43)},
	{::hx::fsObject /*  ::haxe::ds::StringMap */ ,(int)offsetof(AssetCache_obj,sound),HX_("sound",cf,8c,cc,80)},
	{::hx::fsBool,(int)offsetof(AssetCache_obj,_hx___enabled),HX_("__enabled",61,55,7f,ff)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *AssetCache_obj_sStaticStorageInfo = 0;
#endif

static ::String AssetCache_obj_sMemberFields[] = {
	HX_("bitmapData",b9,b5,c0,33),
	HX_("font",cf,5d,c0,43),
	HX_("sound",cf,8c,cc,80),
	HX_("__enabled",61,55,7f,ff),
	HX_("clear",8d,71,5b,48),
	HX_("getBitmapData",ef,11,33,90),
	HX_("getFont",85,0d,43,16),
	HX_("getSound",59,9c,a3,e0),
	HX_("hasBitmapData",b3,6d,17,4e),
	HX_("hasFont",49,7e,04,13),
	HX_("hasSound",15,d7,24,0d),
	HX_("removeBitmapData",1d,d3,69,ed),
	HX_("removeFont",33,98,df,c0),
	HX_("removeSound",eb,69,00,7f),
	HX_("setBitmapData",fb,f3,38,d5),
	HX_("setFont",91,9e,44,09),
	HX_("setSound",cd,f5,00,8f),
	HX_("get_enabled",98,64,2b,04),
	HX_("set_enabled",a4,6b,98,0e),
	::String(null()) };

::hx::Class AssetCache_obj::__mClass;

void AssetCache_obj::__register()
{
	AssetCache_obj _hx_dummy;
	AssetCache_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.utils.AssetCache",0d,cc,3e,c4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(AssetCache_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< AssetCache_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AssetCache_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AssetCache_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace utils
