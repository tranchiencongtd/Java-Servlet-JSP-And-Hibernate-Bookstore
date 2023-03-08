<c:forTokens items="${book.ratingStars}" delims="," var="star">
                     <c:if test="${star eq 'on'}">
                        <img src="${pageContext.request.contextPath}/assets/images/rating_on.png"/>
                     </c:if>
                     <c:if test="${star eq 'off'}">
                        <img src="${pageContext.request.contextPath}/assets/images/rating_off.png"/>
                     </c:if>
                      <c:if test="${star eq 'half'}">
                        <img src="${pageContext.request.contextPath}/assets/images/rating_half.png"/>
                     </c:if>
 </c:forTokens>