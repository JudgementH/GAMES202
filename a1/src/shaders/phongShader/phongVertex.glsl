attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute vec2 aTextureCoord;

uniform mat4 uModelMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat4 uLightMVP;

varying highp vec2 vTextureCoord;
varying highp vec3 vFragPos;
varying highp vec3 vNormal;
varying highp vec4 vPositionFromLight;

void main(void){
  
  vFragPos=(uModelMatrix*vec4(aVertexPosition,1.)).xyz;
  vNormal=(uModelMatrix*vec4(aNormalPosition,0.)).xyz;
  
  gl_Position=uProjectionMatrix*uViewMatrix*uModelMatrix*vec4(aVertexPosition,1.);
  
  vTextureCoord=aTextureCoord;
  
  //normal bias
  
  vPositionFromLight=uLightMVP*vec4(aVertexPosition,1.);
}