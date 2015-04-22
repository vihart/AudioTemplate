
uniform sampler2D t_audio;

varying vec4 vAudio;

varying float vAudioLookup;

varying vec3 vNorm;

void main(){

  //Passing along the normal to the
  //Fragment shader
  vNorm = normal;

  vAudioLookup =  abs( normal.x * normal.y * normal.z * 3. );
  // Here we sample the audio from a texture that we will
  // be creating on the cpu
  vec4 audio = texture2D( t_audio , vec2( vAudioLookup , 0. ));

  vAudio = audio;


  // To visualize the audio, we will displace the position
  // by a value based on the audio, along the normal
  vec3 pos = position  + .05 * length( audio ) * normal;

  //vec3 pos = position;

  // Use this position to get the final position 
  gl_Position = projectionMatrix * modelViewMatrix * vec4( pos , 1.);

}
